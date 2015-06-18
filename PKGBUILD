#Maintainer: Erus <erus.iluvatar@gmail.com>
pkgname=pacman4console
pkgver=1.2
pkgrel=1
pkgdesc="A 9 level ncurses pacman game with editor, patched not to disturb our package manager and to have nice ghosts"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/doctormike/pacman.html"
license=('GPL')
depends=('ncurses')
makedepends=()
source=('http://ftp.debian.org/debian/pool/main/p/pacman4console/pacman4console_1.2.orig.tar.gz' 'pacman4console.patch' 'pacman4console' 'pacman4consoleedit')
md5sums=('1568960898ad9cb66c77412b85cd7d86'
	 'fdd2bd5b2d7f2a4afa5634146449288c'
	 'b913fb9959f2988a41457c270eb0d3b3'
	 'fc43203fcbc5b27872131ac6dfe85ddc')

build() {
  cd pacman-$pkgver/
  patch -i ../$pkgname.patch
  make
}

package() {
  cd pacman-$pkgver/
  make DESTDIR=$pkgdir install || return 1
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 ../pacman4console $pkgdir/usr/share/man/man6/pacman4console.6
  install -D -m644 ../pacman4consoleedit $pkgdir/usr/share/man/man1/pacman4consoleedit.1
}
