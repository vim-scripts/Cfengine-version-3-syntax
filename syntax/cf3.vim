" Vim syntax file
" Language:     Cfengine version 3
" Maintainer:   Neil Watson <neil@watson-wilson.ca>
" Last Change:  Thursday December 24 2009 
" Location:
"
" This is my first attempt at a syntax file.  Feel free to send me correctsion
" or improvements.  I'll give you a credit.
"
" USAGE
" There is already a vim file that uses 'cf' as a file extention.  You can use
" cf3 for your cf3 file extentions or identify via your vimrc file:
" au BufRead,BufNewFile *.cf set ft=cf3
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists ("b:current_syntax")
    finish
endif

syn case ignore
syn keyword cf3Body agent common server executor reporter monitor
syn keyword TODO todo contained
syn match   cf3Comment      /#.*/ contains=TODO
syn match   cf3Identifier   /=>/
" For actions e.g. reports:, commands:
syn match   cf3Action       /[^:]\+:$/
syn match   cf3Class        /[^:]\+::$/
" Escape sequences in regexes
syn match   cf3Esc          /\\\\[sSdD+][\+\*]*/ contained
" Array indexes contained in [].  Does not seems to be working.
syn region  cf3Array        start=/\[/ end=/\]/ contained contains=cf3Var
" Variables wrapped in {} or ()
syn region  cf3Var          start=/\$[{(]/ end=/[})]/ contained contains=cf3Var,cf3Array
syn region  cf3String       start=/"/ skip=/\\"/ end=/"/ contains=cf3Var,cf3Array,cf3Esc
syn keyword cf3Type         int ilist slist float not and string expression 
syn keyword cf3OnOff        on off yes no true false  

if version >= 508 || !exists("did_cfg_syn_inits")
    if version < 508
        let did_cfg_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink cf3Body          Function
    HiLink cf3Comment	    Comment
    HiLink cf3Identifier    Identifier
    HiLink cf3Action        Statement
    HiLink cf3Class         Statement
    HiLink cf3Esc           Special
    HiLink cf3Array         Special
    HiLink cf3Var           Identifier
    HiLink cf3String        String
    HiLink cf3Type          Type
    HiLink cf3OnOff         Boolean

    delcommand HiLink
endif
let b:current_syntax = "cf3"

" CREDITS
" Neil Watson <neil@watson-wilson.ca>
