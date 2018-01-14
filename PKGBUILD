# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r496.gadfaabb7
pkgrel=1
pkgdesc="Qualcomm Atheros Open Powerline Toolkit"
arch=(i686 x86_64)
url=https://github.com/qca/open-plc-utils
license=(custom:Clear_BSD)
_commit=adfaabb741217001c1d4b1d460b3a70a915472b6
source=("git+https://github.com/qca/open-plc-utils#commit=$_commit")
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
