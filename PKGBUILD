# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michele Mocciola <mimocciola@yahoo.com>
_base=TFEL
pkgname=${_base,,}
pkgver=4.2.0
pkgrel=1
pkgdesc="TFEL/MFront introduces DSLs based on C++ to handle material knowledge"
arch=(x86_64)
url="https://github.com/thelfer/${_base}"
license=(GPL3)
depends=(gcc-libs gnuplot)
provides=(mfront)
makedepends=(cmake gcc-fortran)
optdepends=()
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('54fac7e9c939875232eebfd54f521cc6a80e203804a28ea6edf959db0a780e916a26b22df8a3ca5a39e0bf58b18098609228fc284a3f14de989edbecc336408e')

build() {
  cmake \
    -S ${pkgname}-${_base}-${pkgver} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Denable-python=OFF \
    -Denable-python-bindings=OFF \
    -Denable-fortran=ON \
    -Denable-aster=ON \
    -Denable-abaqus=ON \
    -Denable-ansys=ON \
    -Denable-europlexus=ON \
    -Denable-zmat=ON \
    -Denable-cyrano=ON \
    -Denable-calculix=ON \
    -Denable-comsol=ON \
    -Denable-diana-fea=ON \
    -Denable-lsdyna=ON \
    -Denable-cxx-17=ON \
    -Denable-reference-doc=OFF \
    -Wno-dev
  cmake --build build --target all
}

# check() {
#   # cmake --build build --target check
#   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${srcdir}/build/lib/" ctest --verbose --output-on-failure --test-dir build
# }

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${pkgname}-${_base}-${pkgver}/LICENCE-GNU-GPL -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
