# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pybind11_json
pkgname=${_base/_/-}
pkgdesc="Using nlohmann::json with pybind11"
pkgver=0.2.14
pkgrel=1
arch=(any)
url="https://github.com/${_base::6}/${_base}"
license=(BSD-3-Clause)
depends=(pybind11 nlohmann-json)
makedepends=(cmake python)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('5084fa778ca833a93c138649cdf04e7e2b77686c877799507573abc3db438108ee6590d4e204499e07490580f277cc565ca8000db2cb571b7ecdb2103e8f1dfc')

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
