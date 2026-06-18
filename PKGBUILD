pkgname=openxlsx
pkgver=0.5.1
pkgrel=1
pkgdesc="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files"
arch=('x86_64')
url="https://github.com/troldal/OpenXLSX"
license=('BSD-3-Clause')
depends=(glibc libstdc++ libgcc libzip pugixml)
makedepends=('cmake')
source=("https://github.com/troldal/OpenXLSX/archive/v${pkgver}.tar.gz")
sha256sums=('ad31b3774772c163472ec016020df66743879cbe3eaac770be3e198d950286b9')

prepare() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  curl -L https://github.com/troldal/OpenXLSX/pull/216.patch | patch -p1
}

build() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_UNITY_BUILD=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DOPENXLSX_ENABLE_LIBZIP=ON \
    -DOPENXLSX_BUILD_SAMPLES=OFF \
    -DOPENXLSX_CREATE_DOCS=OFF \
    -DUSE_SYSTEM_LIBS=ON \
    -DOPENXLSX_LOCAL_PACKAGES_ONLY=ON .
  make
}

package() {
  cd "$srcdir/OpenXLSX-${pkgver}"
  make install DESTDIR="$pkgdir"
}
