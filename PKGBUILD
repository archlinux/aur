pkgname=phototonic-git
pkgver=1.5.53.g6a5608a
pkgrel=1
pkgdesc="Image Viewer and Organizer"
arch=('i686' 'x86_64')
url="http://oferkv.github.io/phototonic/"
license=('GPL3')
depends=('qt5-base' 'exiv2' 'libxkbcommon-x11')
optdepends=('qt5-imageformats: TIFF and TGA support' 'qt5-svg: SVG support')
makedepends=('git')
provides=('phototonic')
source=("git+https://github.com/oferkv/phototonic.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/phototonic"
  git describe --always | sed "s/^v//;s/-/./g"
}

build() {
  cd "$srcdir/phototonic"
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$srcdir/phototonic"
  make INSTALL_ROOT="$pkgdir/" install
}
