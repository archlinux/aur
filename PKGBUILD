# Maintainer: holomorph

pkgname=geiser
pkgver=0.10
pkgrel=1
pkgdesc='Emacs environment to hack in Scheme'
arch=('any')
url="http://www.nongnu.org/geiser/"
license=('BSD')
optdepends=('racket: scheme implementation'
            'guile: scheme implementation'
            'chicken: scheme implementation')
source=("https://github.com/jaor/geiser/archive/$pkgver.tar.gz")
sha256sums=('1082453d6d388b3ad83b96f193969027ae90c97fcae20a67d08d69786cd58769')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-lispdir='${datadir}/emacs/site-lisp/geiser'
  make all
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
