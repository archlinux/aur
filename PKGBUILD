# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=tabulate
pkgver=1.4
pkgrel=1
pkgdesc="Table maker for modern C++"
arch=(x86_64)
url="https://github.com/p-ranav/${pkgname}"
license=(MIT)
depends=()
makedepends=(cmake)
source=(${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('37d69d53f1c628955f2a35779dbf3053c5b449f7069d846b697b541df1719b00e9b72e9d6de361d9733b7e7543c25e444b1aa139f72000730eeeafa022bbf3c1')

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
