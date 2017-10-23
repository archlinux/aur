# Maintainer: rebel <novakpetya at yahoo dot co dot uk>

pkgname=lazarus-svn
pkgver=1.9
pkgrel=1
pkgdesc="Delphi-like build environment for FreePascal"
arch=(x86_64)
url=https://www.lazarus-ide.org/
license=(LGPL3)
conflicts=(lazarus)
depends=(fpc fpc-src)
makedepends=(subversion)
provides=(lazarus)
source=("$pkgname::svn+https://svn.freepascal.org/svn/lazarus/trunk")

build() {
	cd $pkgname
	make clean lazbuild
}

package() {
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/lib/lazarus
	COMPRESSXZ=(xz -T 0 -c -z -)
	cd $pkgname
	cp -rf * $pkgdir/usr/lib/lazarus
	cd $pkgdir/usr/bin
	ln -f -s ../lib/lazarus/lazbuild lazbuild
	cd $pkgdir/usr/lib/lazarus
	rm -rf debian
	rm -rf lazarus.app
	rm -rf startlazarus.app
	echo "Please be patient! We're on the way but compression takes a lot of time..."
}
sha256sums=('SKIP')
