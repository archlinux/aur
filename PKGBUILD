# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
 
pkgname=emacs-icicles
pkgver=23711 # Taken from icicles.el
pkgrel=1
pkgdesc="an emacs library that enhances minibuffer completion"
arch=('any')
url="http://www.emacswiki.org/emacs/Icicles"
license=('GPL')
source=("icicles.zip::https://github.com/emacsmirror/icicles/archive/master.zip")
md5sums=('4394e032d20a913aae4b552d10071000')
makedepends=(wget)
install=icicles.install

pkgver() {
  cd icicles-master
  echo $(awk '/Update #:/ {print $4}' icicles.el)
}

build() {
  cd icicles-master
  emacs -Q -batch -L . -f batch-byte-compile *.el || true
}

package() {
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/icicles
  cp -r "$srcdir"/icicles-master/* "$pkgdir"/usr/share/emacs/site-lisp/icicles
}

