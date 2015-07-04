# Maintainer: Alexander Schmidt <alex@treefish.org>

pkgname=valentina-hg
pkgver=r1859.df5229c86a28
pkgrel=1
pkgdesc="Sewing pattern drafting tool aiming to remake the garment industry"
arch=('i686' 'x86_64')
url="http://valentinaproject.bitbucket.org"
license=('GPL3')
source=('hg+https://bitbucket.org/dismine/valentina')
depends=('qt5-svg')
makedepends=('mercurial')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/valentina"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/valentina"
  find . -iname '*.png' -exec convert -strip {} {} \;
  qmake PREFIX=/usr PREFIX_LIB=/usr/lib Valentina.pro -r \
  	CONFIG+=noDebugSymbols CONFIG+=no_ccache
  make
}

package() {
  cd "$srcdir/valentina"
  INSTALL_ROOT="$pkgdir/" make install
}
