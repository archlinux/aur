# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=tabulate
pkgver=1.5
pkgrel=1
pkgdesc="Table maker for modern C++"
arch=(x86_64)
url="https://github.com/p-ranav/${pkgname}"
license=(MIT)
depends=()
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('324c9f2427d4d0e568b63fcd7bd81f4eee6743d7106af5ead134f81d637f190f77122f28cc42b9e95f7782f5058492b1903eadb44e1c3061a636b32bb93d0ed2')

build() {
  cmake \
    -S ${pkgname}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
