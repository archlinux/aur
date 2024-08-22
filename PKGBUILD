# Maintainer: Alonso Rodriguez <alonso.rodriguez (at) udc.es>
# Maintainer: Inaki Amatria Barral <i.amatria (at) udc.es>

pkgname=pato
pkgver=1.0.0
pkgrel=0
pkgdesc="PATO: high PerformAnce TriplexatOr is a high performance tool for the fast and efficient detection of triple helices and triplex features in nucleotide sequences"
arch=('any')
url="https://github.com/UDC-GAC/PATO"
license=('MIT')
makedepends=('cmake')
conflicts=('pato' 'pato-git')
provides=('pato')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('50a7992ddf87b36d24bdc1f83da3d346205158fc9a8c1de664df75d6f85fe507')

build() {
  cmake -Bbuild \
        -S"$srcdir/$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Wno-dev
  cmake --build build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./test/test.bash
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
