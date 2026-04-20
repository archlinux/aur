pkgname=openxlsx
pkgver=0.5.0
pkgrel=1
pkgdesc="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files"
arch=('x86_64')
url="https://github.com/troldal/OpenXLSX"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/troldal/OpenXLSX/archive/v${pkgver}.tar.gz")
sha256sums=('3867a84b24c672f09a2698c1381c711fd41702cd6e65e2e3661ae56e01d89e44')

prepare() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  curl -L https://github.com/troldal/OpenXLSX/pull/216.patch | patch -p1
}

build() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  cmake -DOPENXLSX_LIBRARY_TYPE=SHARED -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
  make
}

package() {
  cd "$srcdir/OpenXLSX-${pkgver}"
  make install DESTDIR="$pkgdir"
}
