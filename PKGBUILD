# Contributor: Carlos Aznarán <caznaranl@uni.pe>
pkgname=c-munipack
pkgver=2.1.36
pkgrel=3
pkgdesc="An astrophotometry software package"
arch=(x86_64)
url="https://sourceforge.net/projects/c-munipack"
license=(GPL2)
makedepends=('cfitsio' 'gtk2' 'doxygen' 'gtest' 'python-sphinx' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/c-munipack/files/C-Munipack%202.1%20Stable/${pkgver}/C-Munipack-${pkgver}-source.zip/download")
sha256sums=('048909a4bad44fc801bf341f4a9f6dfda2cb1ff5a0118a094bf01cd3a6533728')

build() {
  cmake \
    -S "C-Munipack-${pkgver}-source" \
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
  install -Dm 644 "C-Munipack-${pkgver}-source/LICENSE.GPL2" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

