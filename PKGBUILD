# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michele Mocciola <mimocciola@yahoo.com>
_base=TFEL
pkgname=${_base,,}
pkgver=4.0
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
sha512sums=('baf10c4dbad10e84e5e1334c106c0f13a5c7d993adf95e6053cc1f4f418a2f6a4bcd19a45957910e7e1eed0e69aeb09499fda24c4d3c9b5d0b343b0e1b6e7883')

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
