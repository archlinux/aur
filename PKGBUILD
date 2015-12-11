pkgname=phototonic
pkgver=1.7.13
pkgrel=1
phototonic_commit=c1998178dfc49275c716250914ee1aac910ab908
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'libxkbcommon-x11')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
provides=('phototonic')
source=("https://github.com/oferkv/phototonic/archive/$phototonic_commit.tar.gz")
md5sums=('6c65ca3cb26f575c3983bcde15246ada')

build() {
  cd "$srcdir/$pkgname-$phototonic_commit"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/$pkgname-$phototonic_commit"
  make INSTALL_ROOT="$pkgdir/" install
}
