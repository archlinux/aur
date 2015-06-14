# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=vim-notes-git
pkgver=0.23.4
pkgrel=1
pkgdesc='Easy note taking in Vim '
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3375'
license=('MIT')
groups=('vim-plugins')
depends=(python vim-misc-xolox)
conflicts=(vim-notes)
provides=(vim-notes)
install='vimdoc.install'
source=('git://github.com/xolox/vim-notes.git')
sha256sums=('SKIP')
_gitname='vim-notes'
pkgver() {
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    git describe --tags | sed 's|-|.|g'
  fi
}
package(){
  cd "$srcdir"/$_gitname
  _vim_dir='/usr/share/vim/vimfiles'
  install -d "$pkgdir"/$_vim_dir

  tar -c ./ \
    --exclude .git \
    --exclude autoload/xolox/misc \
    --exclude INSTALL.md \
    --exclude README.md \
    --exclude TODO.md \
    --exclude .gitignore \
    --exclude addon-info.json \
    | tar -x -C "$pkgdir"/$_vim_dir
}
