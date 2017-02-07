# Maintainer: Alexander Schmidt <alex@treefish.org>

pkgname=valentina-hg
pkgver=r4337.847160e6d4af
pkgrel=1
pkgdesc="Sewing pattern drafting tool aiming to remake the garment industry"
arch=('i686' 'x86_64')
url="http://valentinaproject.bitbucket.org"
license=('GPL3')
source=('hg+https://bitbucket.org/dismine/valentina')
depends=('qt5-svg')
makedepends=('mercurial' 'qt5-tools')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/valentina"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/valentina"
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
    	CONFIG+=noTests CONFIG+=no_ccache CONFIG+=noRunPath \
	CONFIG+=noDebugSymbols
  make
}

package() {
  cd "$srcdir/valentina"
  INSTALL_ROOT="$pkgdir/" make install
}
