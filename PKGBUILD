# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
pkgver=23658 # Taken from icicles.el
pkgrel=1
pkgdesc="an emacs library that enhances minibuffer completion"
arch=('any')
url="http://www.emacswiki.org/emacs/Icicles"
license=('GPL')
makedepends=(wget)
source=(http://www.emacswiki.org/emacs/download/get-icicles.sh)
md5sums=('93857a3934a576e9fbf69f2c7f355ebd')
install=icicles.install

build() {
  [ -d icicles ] && rm -r icicles
  chmod +x get-icicles.sh
  ./get-icicles.sh -v
  cd icicles
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}
package() {
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/icicles
  cp -r "$srcdir"/icicles/* "$pkgdir"/usr/share/emacs/site-lisp/icicles
}
