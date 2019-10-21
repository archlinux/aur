pkgname=dmrconfig-git
pkgver=r240.e47491e
pkgrel=1
pkgdesc="DMRconfig is a utility for programming digital radios via USB programming cable."
arch=('x86_64' 'aarch64')
depends=('libusb>=1.0')
license=('Apache 2.0')
url="https://github.com/sergev/dmrconfig.git"
source=('git+https://github.com/sergev/dmrconfig.git')
sha256sums=('SKIP')

pkgver() {
 	cd $srcdir/dmrconfig
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/dmrconfig
	make
}

package() {
	cd $srcdir/dmrconfig
	install -D -m755 dmrconfig  $pkgdir/usr/bin/dmrconfig
	install -D -m644 99-dmr.rules $pkgdir/usr/lib/udev/rules.d/99-dmr.rules
}
