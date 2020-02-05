# Maintainer: holomorph

pkgname=geiser
pkgver=0.11
pkgrel=1
pkgdesc='Emacs environment to hack in Scheme'
arch=('any')
url="http://www.nongnu.org/geiser/"
license=('BSD')
optdepends=('racket: scheme implementation'
            'guile: scheme implementation'
            'chicken: scheme implementation')
            source=("https://gitlab.com/jaor/geiser/-/archive/$pkgver/geiser-$pkgver.tar.gz")
sha256sums=('726f2371e44b6e8991a0c7034bfaefcd08a0395e89948387a7e7cdf2cdd7c60d')

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
