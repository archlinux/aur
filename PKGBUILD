# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=uARMSolver
pkgname=${_base,,}
pkgver=0.2.4
pkgrel=1
pkgdesc="Universal Association Rule Mining Solver"
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
arch=(any)
# depends=()
makedepends=(cmake)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('9f693e0168e6715efb61ffbb2f1ea523bf554bb82741e2fe92a0ed770838431033fd035eef76a4c57675f9ccb08c551aeb6dedb5da2473364c63e4c6e7cd150b')

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
