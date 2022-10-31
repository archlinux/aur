# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=QXlsx
pkgname=${_base,,}
pkgver=1.4.4
pkgrel=1
pkgdesc="Excel file(*.xlsx) reader/writer library using Qt 5 or 6"
arch=(x86_64)
url="https://github.com/QtExcel/${_base}"
license=(MIT)
depends=('qt6-base')
makedepends=('cmake' 'ninja')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e6c3dd8822f2a8ab8bcd1a7434db7b202291e3d8de407e4629bdfc1afef507b57da4bc4a715d57b8d75915ce4b623189269083824c35d8e02d49d3e8909cceee')

build() {
  cmake \
    -S ${_base}-${pkgver}/${_base} \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DQT_VERSION=6 \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  find "${pkgdir}" -type d -empty -delete
}
