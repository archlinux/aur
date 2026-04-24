# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=xad
pkgver=2.1.0
pkgrel=1
pkgdesc="Comprehensive C++ library for automatic differentiation"
arch=(x86_64)
url="https://github.com/auto-differentiation/${pkgname}"
license=(AGPL-3.0-or-later)
depends=()
makedepends=(cmake)
# checkdepends=(gtest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e2e3a847d975dc9fcbd7be8277e93fb417d263aec566f2e46a809135460860caba966980823afb66d764bb0b2eb4d8d24765a8aadadb730aeb743a36b399fbde')

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
