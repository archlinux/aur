# Maintainer: holomorph

pkgname=geiser
pkgver=0.7
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
sha256sums=('af2952b1c184ef4e11053f2d665b40825fd116f5bb17a8d8b00b3c2815bd67ed')

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
