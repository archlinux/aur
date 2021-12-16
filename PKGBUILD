# Maintainer: Spagootie <nelsonbyrd248 at gmail dot com>

pkgname=neo
_pkgname=neo-git 
pkgver=r19.31391fd
pkgrel=1
pkgdesc='Simulates the digital rain from The Matrix (cmatrix clone with 32-bit color and Unicode support)'
arch=('i686' 'x86_64')
url='https://github.com/st3w/neo'
license=('GPL3')
depends=("make" "ncurses" "autoconf")
makedepends=('git')
source=('git+https://github.com/st3w/neo.git')
conflicts=($_pkgname)
provides=($_pkgname)
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure
  make
}

package() {
  install -Dm755 ../src/neo/src/neo "$pkgdir/usr/bin/neo"
  install -Dm644 ../src/neo/doc/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
