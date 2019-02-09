# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=cbmem-git
pkgver=1.1.f813b844862
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
	echo "1.1.$(git log -1 --format="%h")"
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
