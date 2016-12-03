# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r447.g6a07d621583c
pkgrel=1
pkgdesc="Qualcomm Atheros Open Powerline Toolkit"
arch=(i686 x86_64)
url=https://github.com/qca/open-plc-utils
license=(custom:Clear_BSD)
source=("git+https://github.com/qca/open-plc-utils")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
	cd $pkgname
	make
}

package() {
	cd $pkgname
	make ROOTFS="$pkgdir" BIN="$pkgdir"/usr/bin install manuals
	mv "$pkgdir"/usr/bin/amptest{,.plc}
	install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
