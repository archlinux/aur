# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=uARMSolver
pkgname=${_base,,}
pkgver=0.2.2
pkgrel=1
pkgdesc="Universal Association Rule Mining Solver"
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
arch=('any')
# depends=()
makedepends=(cmake)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('973ba1036c1061a7ec4f0c30f4989a931db51a7286d7236777a3d46fd08a280144d595c54363d424caa50b4d8c925dc9fc37894e655ca13e383aa41e59247a64')

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
