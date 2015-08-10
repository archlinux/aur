# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: daf666

_pkgname=phototonic
pkgname=$_pkgname-git
pkgver=1.6.17.gaffa7c3
pkgrel=1
pkgdesc="Image Viewer and Organizer"
arch=("i686" "x86_64")
url="http://oferkv.github.io/phototonic/"
license=("GPL3")
depends=("qt5-base" "exiv2" "libxkbcommon-x11")
optdepends=("qt5-imageformats: TIFF and TGA support" "qt5-svg: SVG support")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/oferkv/$_pkgname.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/^v//;s/-/./g"
}

build() {
  cd $_pkgname
  qmake-qt5 PREFIX="/usr" \
            QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
            QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
            QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd $_pkgname
  make INSTALL_ROOT=$pkgdir install
}
