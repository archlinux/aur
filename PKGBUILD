# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michele Mocciola <mimocciola@yahoo.com>
_base=TFEL
pkgname=${_base,,}
pkgver=5.1.0
pkgrel=1
pkgdesc="TFEL/MFront introduces DSLs based on C++ to handle material knowledge"
arch=(x86_64)
url="https://github.com/thelfer/${_base}"
license=(GPL-3.0-or-later)
depends=(gcc-libs gnuplot)
provides=(mfront)
makedepends=(cmake gcc-fortran)
optdepends=()
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('384f6f19b0ad7587f5bf6f1ff5c32483982369bf6b97c3e5c2fb473a310e8eba916b012eebd2771875a385eec1e1a223fa94b0404b18c181e164663ee9cae2d1')

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
