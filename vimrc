call pathogen#incubate()
call pathogen#helptags()

" Change the leader from \ to ,
let mapleader=","

filetype plugin indent on 

" Hides buffers instead of closing them.
set hidden

" Turn on syntax highlighing
syntax enable
"set background=dark
"colorscheme solarized

" #Formatting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Allow backspace over indent, elo, and the start of an insert
set backspace=2

set number " show lines
set shiftround " use multiple of shiftwidth when indenting with < and >
set showmatch " set show matching parenthesis
set ignorecase " ignorecase when searching
set smartcase " ignorecase if search pattern is all lowercase, otherwise case-sensitive
set smarttab " inserttabs on the start of a line according to shiftwidth, not tabstop
set hlsearch " highlight search terms
set incsearch " show search matches as you type

" no bells!!
set vb

" Unbreak History
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title

" Dont use backup files
set nobackup
set noswapfile

" Status Bar
set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)
set laststatus=2
hi statusline term=reverse

" Dont update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner. In OSX, if this is
" set and lazyredraw it's pretty slow.
set showcmd

" Show current mode
set showmode

" Make the command-line completion better
set wildmenu

" When completing by tag, show the while tag, not just the function name
set showfulltag

" Let the syntax highlighting for java files allow cpp keywords
let java_allow_cpp_keywords=1

autocmd filetype python set expandtab

" Mappings
nmap <silent> <CR> :nohlsearch<CR>
imap <Tab> <C-N>

imap <C-c> <esc>

map <silent> <C-a> 0
map <silent> <C-e> $

"Quickly edit/reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <silent> <leader>ff :call g:Jsbeautify()<cr>

" open and move to new vertial split
nnoremap <C-v> <C-w>v<C-w>l

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<c>

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col -1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
