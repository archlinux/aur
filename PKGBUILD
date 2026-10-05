# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=tabulate
pkgver=2.0
pkgrel=1
pkgdesc="Table maker for modern C++"
arch=(x86_64)
url="https://github.com/p-ranav/${pkgname}"
license=(MIT)
depends=()
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('50508ac58fdb7542a095b02e04da32f87ae6595b5c0de143b5071878ea819db01b71b21d8aed1a99c6fd22342bbd5fa531d9a354723ba2e5513a8e858233ee09')

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
