# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Michael Straube <straubem at gmx dot de>
# Contributor: Ofer Kashayov <oferkv at gmail dot com>

pkgname=phototonic
pkgver=1.7.13
pkgrel=2
_commit=c1998178dfc49275c716250914ee1aac910ab908
pkgdesc='Image Viewer and Organizer'
arch=('i686' 'x86_64')
url='https://github.com/oferkv/phototonic/'
license=('GPL3')
depends=('qt5-base' 'exiv2' 'hicolor-icon-theme')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oferkv/phototonic/archive/$_commit.tar.gz")
sha256sums=('28994936d559c8ffd92da661460c7b7e404455ef88293fcfc1d7de0640612852')

build() {
  cd $pkgname-$_commit

  qmake-qt5 PREFIX="/usr" \
    QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd $pkgname-$_commit

  make INSTALL_ROOT="$pkgdir" install
}
