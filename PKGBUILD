# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=xad
pkgver=1.7.0
pkgrel=1
pkgdesc="Comprehensive C++ library for automatic differentiation"
arch=(x86_64)
url="https://github.com/auto-differentiation/${pkgname}"
license=(AGPL-3.0-only)
depends=()
makedepends=(cmake)
# checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('86d2691e0d3ec1e28682d5806b3c1fe9d74bc238dfe7aa3fe06a62eb6bd9e23140a98f65e3c303b69714d1c419464c0e953e442532437c6cd2d9dae80b1cc5f9')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DXAD_ENABLE_TESTS=OFF \
    -Wno-dev
  cmake --build build --target all
}

# check() {
#   ctest --test-dir build
# }

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm644 ${pkgname}-${pkgver}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
