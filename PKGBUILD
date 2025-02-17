# Maintainer:
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=matplotplusplus
pkgver=1.2.2
pkgrel=1
pkgdesc="Matplot++: A C++ Graphics Library for Data Visualization"
arch=('x86_64')
url="https://alandefreitas.github.io/matplotplusplus"
license=('MIT')
depends=('fftw' 'gcc-libs' 'glibc' 'gnuplot' 'libjpeg-turbo' 'libpng' 'libtiff' 'zlib')
makedepends=('cimg' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alandefreitas/matplotplusplus/archive/v${pkgver}.tar.gz")
sha256sums=('c7434b4fea0d0cc3508fd7104fafbb2fa7c824b1d2ccc51c52eaee26fc55a9a0')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DBUILD_SHARED_LIBS=ON \
    -DMATPLOTPP_BUILD_EXAMPLES=OFF \
    -DMATPLOTPP_BUILD_TESTS=OFF \
    -DMATPLOTPP_WITH_SYSTEM_CIMG=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cmake --install build

  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
