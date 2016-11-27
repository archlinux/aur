# Maintainer: holomorph

pkgname=geiser
pkgver=0.9
pkgrel=1
pkgdesc='Emacs environment to hack in Scheme'
arch=('any')
url="http://www.nongnu.org/geiser/"
license=('BSD')
optdepends=('racket: scheme implementation'
            'guile: scheme implementation'
            'chicken: scheme implementation')
source=("https://github.com/jaor/geiser/archive/$pkgver.tar.gz")
sha256sums=('72f29b6dc48e8ac8ada50d1d9d781f0cb1c94985e0f6d187838d3e4322fb58a9')

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
