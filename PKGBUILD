# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=uARMSolver
pkgname=${_base,,}
pkgver=0.2.5
pkgrel=1
pkgdesc="Universal Association Rule Mining Solver"
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
arch=(any)
# depends=()
makedepends=(cmake)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('dd63b799a3e215dc0fc49636f81d2f3156e51657212469d05f05e4ce9cefbe386f74c414d8213cf9be0879e49a93ee923a1552b0cd6a5036ceee0e3c3ac3acd0')

build() {
  cmake \
    -S ${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -Wno-dev
  cmake --build build --target all
}

package() {
  install -Dvm755 "build/${_base}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "${_base}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${_base}-${pkgver}/${_base}.1" -t "${pkgdir}/usr/share/man/man1/"
  install -Dm 644 "${_base}-${pkgver}/bin/README.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
