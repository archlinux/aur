# Maintainer: Sergey Khorev <sergey.khorev@gmail.com>
pkgname=vim-repl-git
pkgver=20131113
pkgrel=1
pkgdesc="Minimalistic REPL plugin for Vim"
arch=(any)
url="https://github.com/khorser/vim-repl"
license=('BSD')
groups=()
depends=('vim-vimproc')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/khorser/vim-repl.git
_gitname=vim-repl

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D autoload/repl.vim  ${pkgdir}/usr/share/vim/vimfiles/autoload/repl.vim
  install -D plugin/repl.vim  ${pkgdir}/usr/share/vim/vimfiles/plugin/repl.vim
  install -D syntax/repl.vim  ${pkgdir}/usr/share/vim/vimfiles/syntax/repl.vim
}

# vim:set ts=8 sts=2 sw=2 et:
