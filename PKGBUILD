# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pybind11_json
pkgname=${_base/_/-}
pkgdesc="Using nlohmann::json with pybind11"
pkgver=0.2.15
pkgrel=1
arch=(any)
url="https://github.com/${_base::6}/${_base}"
license=(BSD-3-Clause)
depends=(pybind11 nlohmann-json)
makedepends=(cmake python)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('054c06dc5f30815fc0ef6517bd48605642c14dcdffd7558e826c0485f86b4ddf3d4a44ab3651dd29bd491db8f51cad2844bbb55bc22dbcdd84a77d058329ed04')

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
