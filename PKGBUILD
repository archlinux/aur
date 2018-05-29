# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Michael Straube <straubem at gmx dot de>
# Contributor: Ofer Kashayov <oferkv at gmail dot com>

pkgname=phototonic
pkgver=2.1
pkgrel=1
pkgdesc='Image Viewer and Organizer'
arch=('i686' 'x86_64')
url='https://github.com/oferkv/phototonic/'
license=('GPL3')
depends=('qt5-base' 'exiv2' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oferkv/phototonic/archive/v${pkgver}.tar.gz")
sha256sums=('a8b2dbc81750efabb65a4732b1704641afd4a4f772ef9c90817871ca2a52f5ef')

build() {
  rm -Rf build && mkdir build
  cd build
  qmake-qt5 ${srcdir}/${pkgname}-${pkgver} \
            PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="${CPPFLAGS} ${CFLAGS}" \
            QMAKE_CXXFLAGS_RELEASE="${CPPFLAGS} ${CXXFLAGS}" \
            QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd build
  make INSTALL_ROOT="${pkgdir}" install
}
