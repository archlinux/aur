# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=xad
pkgver=1.8.0
pkgrel=1
pkgdesc="Comprehensive C++ library for automatic differentiation"
arch=(x86_64)
url="https://github.com/auto-differentiation/${pkgname}"
license=(AGPL-3.0-or-later)
depends=()
makedepends=(cmake)
# checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0609bce53e5eb1c1205efb9a57d613fb2312f6dd04c5e22c1c4b1c62c22be2111d00eb8039c57c0724d94af13a0c6a80f8a13cd927a340c2d9c593af26d98b32')

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
