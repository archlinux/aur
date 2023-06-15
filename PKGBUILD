# Contributor: Carlos Aznarán <caznaranl@uni.pe>
_base=C-Munipack
pkgname=${_base,,}
pkgver=2.1.35
pkgrel=1
pkgdesc="An astrophotometry software package"
arch=(x86_64)
url="https://sourceforge.net/projects/${pkgname}"
license=(GPL2)
makedepends=(cfitsio gtk2 doxygen gtest python-sphinx)
source=(https://altushost-swe.dl.sourceforge.net/project/${pkgname}/${_base}%202.1%20Stable/${pkgver}/${_base}-${pkgver}-source.zip)
sha512sums=('9012dfd5906694679e1e9d99d04aef6dd97086813f8d7519b7af0e7ef862be32f000e6e79ae65a515228a4224602c8e92216388e754bc1fa05514be15dd30184')

build() {
  cmake \
    -S ${_base}-${pkgver}-source \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=NO \
    -DENABLE_CXX_WRAPPER=YES \
    -DENABLE_DOC=NO \
    -DENABLE_LIME=NO \
    -DENABLE_LIME_X3DH=YES \
    -DENABLE_UNIT_TESTS=NO \
    -DENABLE_STRICT=NO \
    -DCMAKE_INSTALL_RPATH=NO
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 ${_base}-${pkgver}-source/LICENSE.GPL2 -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

