# Maintainer: Alonso Rodriguez <alonso.rodriguez (at) udc.es>
# Maintainer: Inaki Amatria Barral <i.amatria (at) udc.es>

pkgname=pato
pkgver=1.0.1
pkgrel=0
pkgdesc="PATO: high PerformAnce TriplexatOr is a high performance tool for the fast and efficient detection of triple helices and triplex features in nucleotide sequences"
arch=('any')
url="https://github.com/UDC-GAC/PATO"
license=('MIT')
makedepends=('cmake')
conflicts=('pato' 'pato-git')
provides=('pato')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3dcacfff4a7c03f2b6220ca7f887b649b2a95799c9b1c71c260a2bfce4d5f773')

build() {
  cmake -B"$srcdir/PATO-$pkgver/build" \
        -S"$srcdir/PATO-$pkgver" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev
  cmake --build "$srcdir/PATO-$pkgver/build"
}

check() {
  cd "$srcdir/PATO-$pkgver"
  ./test/test.bash
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/PATO-$pkgver/build"
}
