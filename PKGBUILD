# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-tabbar
pkgver=2.2
pkgrel=1
pkgdesc="Emacs minor mode that displays a tab bar at the top"
arch=('any')
url="https://github.com/dholm/tabbar.git"
license=('GPL')
makedepends=('git')
source=("${pkgname#emacs-}-$pkgver.tar.gz::https://github.com/dholm/tabbar/archive/v$pkgver.tar.gz")
sha256sums=('3499ca9b758983fbe1e0eaab045de127440e82429ae9089486bece531c86decc')

build() {
  cd ${pkgname#emacs-}-$pkgver
  emacs -Q -batch -L . -f batch-byte-compile *.el
}

package() {
  cd ${pkgname#emacs-}-$pkgver
  install -d "$pkgdir"/usr/share/emacs/site-lisp/tabbar
  for _i in *.el *elc *.tiff *.png
  do
    install -Dm644 $_i "$pkgdir"/usr/share/emacs/site-lisp/tabbar/${_i}
  done
}
