# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r510.g32408520
pkgrel=2
pkgdesc="Qualcomm Atheros Open Powerline Toolkit for HomePlug AV"
arch=(i686 x86_64)
url=https://github.com/qca/open-plc-utils
license=(custom:Clear_BSD)
_commit=32408520fcebe785983a68e39ec83830a3005779
source=("git+https://github.com/qca/open-plc-utils#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

build() {
	cd $pkgname
	make EXTRA_CFLAGS="-fcommon"
}

package() {
	cd $pkgname
	make ROOTFS="$pkgdir" BIN="$pkgdir"/usr/bin install manuals
	mv "$pkgdir"/usr/bin/amptest{,.plc}
	mv "$pkgdir"/usr/bin/pev{,.plc}
	install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
