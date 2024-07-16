# Maintainer:
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=matplotplusplus
pkgver=1.2.1
pkgrel=1
pkgdesc="Matplot++: A C++ Graphics Library for Data Visualization"
arch=('x86_64')
url="https://alandefreitas.github.io/matplotplusplus"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gnuplot' 'libjpeg-turbo' 'libpng' 'libtiff' 'zlib')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alandefreitas/matplotplusplus/archive/v${pkgver}.tar.gz")
sha256sums=('9dd7cc92b2425148f50329f5a3bf95f9774ac807657838972d35334b5ff7cb87')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DBUILD_SHARED_LIBS=ON \
    -DMATPLOTPP_BUILD_EXAMPLES=OFF \
    -DMATPLOTPP_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  cmake --install build

  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
