
# Maintainer: Dennis Gosnell <cdep.illabout@gmail.com>
pkgname=wmacpi
pkgver=2.2rc5
pkgrel=1
pkgdesc="Battery monitor dockapp for Window Maker that doesn't depend on HAL"
arch=('i686' 'x86_64')
url="http://himi.org/wmacpi/"
license=('GPL')
depends=(libdockapp)
source=(http://himi.org/wmacpi/download/$pkgname-$pkgver.tar.bz2)
md5sums=('9e7a791818cd9646c31e2dbff418ea74')


build() {
	cd "$srcdir/$pkgname-$pkgver"

	# make sure we don't build the command line `acpi` tool
	sed -i 's/^BUILD_CLI = 1$/#BUILD_CLI = 1/' Makefile

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# make sure we install the man pages in the right place
	sed -i 's|man/man1|share/man/man1|' Makefile
 
	make install PREFIX="$pkgdir/usr/"
}
