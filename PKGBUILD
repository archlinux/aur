# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-tabbar-git
epoch=1
pkgver=2.2.390
pkgrel=1
pkgdesc="Emacs minor mode that displays a tab bar at the top"
arch=('any')
url="https://github.com/dholm/tabbar.git"
license=('GPL')
makedepends=('git')
source=("git://github.com/dholm/tabbar.git")
md5sums=('SKIP')
_gitname="tabbar"

pkgver() {
  cd "$_gitname"
  printf "%s.%s" "$(git describe --tags|tr -d v)" "$(git rev-list --count HEAD)"
}

build() {
  cd "$_gitname"
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd "$_gitname"
  install -d "$pkgdir"/usr/share/emacs/site-lisp/tabbar
  for _i in *.el *.elc *.tiff *.png
  do
    install -Dm644 $_i "$pkgdir"/usr/share/emacs/site-lisp/tabbar/${_i}
  done
}
