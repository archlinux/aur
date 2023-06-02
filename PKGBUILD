pkgname=openxlsx
pkgver=0.3.2
pkgrel=1
pkgdesc="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files"
arch=('x86_64')
url="https://github.com/troldal/OpenXLSX"
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/troldal/OpenXLSX/archive/v${pkgver}.tar.gz")
sha256sums=('e379f29a8ba4c4c33a2ef0589cf2fbc956411514748b2b7b45aaeff393e52cb3')

prepare() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  curl -L https://github.com/troldal/OpenXLSX/pull/216.patch | patch -p1
}

build() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  cmake -DOPENXLSX_LIBRARY_TYPE=SHARED .
  make
}

package() {
  cd "$srcdir/OpenXLSX-${pkgver}"
  make install DESTDIR="$pkgdir"
}
