# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=QXlsx
pkgname=${_base,,}
pkgver=1.4.5
pkgrel=1
pkgdesc="Excel file(*.xlsx) reader/writer library using Qt 5 or 6"
arch=(x86_64)
url="https://github.com/QtExcel/${_base}"
license=(MIT)
depends=('qt6-base')
makedepends=('cmake' 'ninja')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5ec63c210b12c037acd9f3cc4d351b9bd488add65872a27cca536117349ac2c2501649cb7c2f35e1ee95289e98bf9e9fea6554aef1379deafb50c5016ed21fe5')

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
