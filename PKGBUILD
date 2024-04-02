pkgname=aif-master
_pkgrun="aif"
pkgver=2.8
pkgrel=1
pkgdesc="Bash script for installing the Archlinux system on a computer."
arch=('any')
url="https://github.com/maximalisimus/${pkgname}.git"
license=('GPL')
depends=(arch-install-scripts dialog ncurses lib32-ncurses pacman-contrib parted util-linux gptfdisk python wget curl sed gawk grep)
makedepends=(git imagemagick)
replaces=($pkgname)

source=("$pkgname::git+https://github.com/maximalisimus/${pkgname}.git"
	)
	
sha256sums=('SKIP'
			)

prepare() {
	cd ${srcdir}/$pkgname
	mkdir -p ./post/
	make DESTDIR=./post/ all
	make DESTDIR=./post/ install
}

package() {
	mkdir -p $pkgdir/usr/
	cp -a ${srcdir}/$pkgname/post/usr/* $pkgdir/usr/
}
