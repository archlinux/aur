# Maintainer: holomorph

pkgname=geiser
pkgver=0.8.1
pkgrel=1
pkgdesc='Emacs environment to hack in Scheme'
arch=('any')
url="http://www.nongnu.org/geiser/"
license=('BSD')
optdepends=('racket: scheme implementation'
            'guile: scheme implementation'
            'chicken: scheme implementation')
install=geiser.install
source=("https://github.com/jaor/geiser/archive/$pkgver.tar.gz")
sha256sums=('e891b6f488d7bd8056e8c2ff590e4862497703484282efa43d8ac1196d5a933d')

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
