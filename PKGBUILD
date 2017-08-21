
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thefile-blueprint
pkgver=4.0
pkgrel=0
pkgdesc="Simple File Manager"
arch=("x86_64")
url="https://github.com/vicr123/thefile"
license=('GPL2')
depends=('xdg-utils' 'qt5-base')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/thefile#branch=rewrite'
	"thefile-b.desktop")
md5sums=('SKIP'
	 'SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
	cd $srcdir
	rm $pkgdir/usr/share/applications/thefile.desktop
	cp "thefile-b.desktop" "$pkgdir/usr/share/applications"
	mv $pkgdir/usr/bin/thefile $pkgdir/usr/bin/thefile-b
}
