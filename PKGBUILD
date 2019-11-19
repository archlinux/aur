# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vim-dhall-git
pkgver=r116.20d2fa23dd
pkgrel=1
pkgdesc="Vim syntax for Dhall config files"
arch=('any')
url="https://github.com/vmchale/dhall-vim"
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dhall-vim"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=10 HEAD)"
}

package() {
  local _vimfiles="$pkgdir/usr/share/vim/vimfiles"
  cd "$srcdir/dhall-vim"
  for dir in ftdetect ftplugin syntax
  do
    install -Dm644 "$dir/dhall.vim" "$_vimfiles/$dir/dhall.vim"
  done
  install -Dm644 "doc/dhall.txt" "$_vimfiles/doc/dhall.txt"
}
