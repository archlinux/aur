pkgname=openxlsx
pkgver=0.5.0
pkgrel=1
pkgdesc="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files"
arch=('x86_64')
url="https://github.com/troldal/OpenXLSX"
license=('BSD-3-Clause')
depends=(glibc libstdc++ libgcc libzip pugixml)
makedepends=('cmake')
source=("https://github.com/troldal/OpenXLSX/archive/v${pkgver}.tar.gz")
sha256sums=('3867a84b24c672f09a2698c1381c711fd41702cd6e65e2e3661ae56e01d89e44')

prepare() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  curl -L https://github.com/troldal/OpenXLSX/pull/216.patch | patch -p1
}

build() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_UNITY_BUILD=ON \
    -DOPENXLSX_LIBRARY_TYPE=SHARED \
    -DOPENXLSX_ENABLE_LIBZIP=ON \
    -DOPENXLSX_BUILD_SAMPLES=OFF \
    -DOPENXLSX_CREATE_DOCS=OFF \
    -DUSE_SYSTEM_LIBS=ON .
  make
}

package() {
  cd "$srcdir/OpenXLSX-${pkgver}"
  make install DESTDIR="$pkgdir"
}
