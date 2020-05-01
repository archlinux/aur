# Maintainer: Jan Seeger <jan.seeger+arch@thenybble.de>

pkgname=valentina-git
pkgver=rcf51f3837
pkgrel=1
pkgdesc="Sewing pattern drafting tool aiming to remake the garment industry"
arch=('i686' 'x86_64')
url="https://gitlab.com/smart-pattern/valentina"
license=('GPL3')
source=('git+https://gitlab.com/smart-pattern/valentina.git#branch=develop')
depends=('qt5-svg')
makedepends=('git' 'qt5-tools')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/valentina"
  printf "r%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/valentina"
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
    	CONFIG+=noTests CONFIG+=no_ccache CONFIG+=noRunPath \
	CONFIG+=noDebugSymbols
  make -j $(nproc)
}

package() {
  cd "$srcdir/valentina"
  INSTALL_ROOT="$pkgdir/" make install
}
