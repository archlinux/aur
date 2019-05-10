# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=cbmem-git
pkgver=latest
pkgrel=1
pkgdesc="A utility for reading from the CBMEM console on Coreboot systems"
url="https://www.coreboot.org/Cbmem_console"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('cbmem')
provides=('cbmem')
source=('git+https://review.coreboot.org/coreboot')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/coreboot"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/coreboot/util/cbmem"
	make
}

package() {
	cd "$srcdir/coreboot/util/cbmem"
	install -d "$pkgdir/usr/bin"
	install -m755 cbmem "$pkgdir/usr/bin/cbmem"
}
