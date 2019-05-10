# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=nvramtool-git
pkgver=latest
pkgrel=1
pkgdesc="A utility for interfacing with CMOS/NVRAM on Coreboot systems"
url="https://www.coreboot.org/Nvramtool"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('nvramtool')
provides=('nvramtool')
source=('git+https://review.coreboot.org/coreboot')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/coreboot"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/coreboot/util/nvramtool"
	make
}

package() {
	cd "$srcdir/coreboot/util/nvramtool"
	install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man8"
	install -m755 nvramtool "$pkgdir/usr/bin/nvramtool"
	install -m644 cli/nvramtool.8 "$pkgdir/usr/share/man/man8"
}
