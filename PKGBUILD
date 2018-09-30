# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=wxhexeditor-git
_pkgbasename=wxhexeditor
pkgver=r663.16f75d1
pkgrel=1
pkgdesc="a free hex editor / disk editor for Linux, Windows and MacOSX"
arch=('i686' 'x86_64')
url="http://wxhexeditor.sourceforge.net/"
license=('GPL')
depends=('wxgtk' 'openmp')
makedepends=('git')
provides=('wxhexeditor')
conflicts=('wxhexeditor')
source=('wxhexeditor::git+https://github.com/EUA/wxHexEditor.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbasename"

  ## stolen from the wiki ##
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbasename"
  export LDFLAGS="${LDFLAGS} -fopenmp"
  make CXXFLAGS="${CXXFLAGS/-fopenmp/}"
}

package() {
  cd "$srcdir/$_pkgbasename"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
