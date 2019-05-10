# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=ectool-git
pkgver=latest
pkgrel=1
pkgdesc="Dumps the RAM of a laptop's Embedded/Environmental Controller (EC)"
url="https://www.coreboot.org/Ectool"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('ectool')
provides=('ectool')
source=('git+https://review.coreboot.org/coreboot')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/coreboot"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/coreboot/util/ectool"
	make
}

package() {
	cd "$srcdir/coreboot/util/ectool"
	install -d "$pkgdir/usr/bin"
	install -m755 ectool "$pkgdir/usr/bin/ectool"
}
