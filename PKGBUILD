# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pybind11_json
pkgname=${_base/_/-}
pkgdesc="Using nlohmann::json with pybind11"
pkgver=0.2.13
pkgrel=1
arch=(any)
url="https://github.com/${_base::6}/${_base}"
license=('custom:BSD-3-clause')
depends=(pybind11 nlohmann-json)
makedepends=(cmake python)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1d29d5a3a4e4cca8555a20c9a872b05804bcbbda0a6e001fdf9ea2070f63776f33fddfac6794c60d668fcab68f9c4ef312002c411323ae18562441631d3912b0')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
