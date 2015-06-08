# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=svg-cleaner-bzr
pkgver=43
pkgrel=1
pkgdesc="svg cleaner"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~svg-cleaner-team/svg-cleaner/svgcleaner"
license=('GPL3')
depends=('perl' 'qt4')
makedepends=('bzr')
source=('bzr+http://bazaar.launchpad.net/~svg-cleaner-team/svg-cleaner/svgcleaner/')
md5sums=('SKIP')
_bzrmod="svgcleaner"

pkgver() {
  bzr revno $srcdir/$_bzrmod
}

build() {
  cd "$srcdir/$_bzrmod"
  qmake-qt4 
  sed -i s+lrelease+lrelease-qt4+ "$srcdir/$_bzrmod"/Makefile
  make 
}

package() {
  cd "$srcdir/$_bzrmod"
  make INSTALL_ROOT="$pkgdir" install
}
