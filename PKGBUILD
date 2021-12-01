# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r524.gbb50f635
pkgrel=1
pkgdesc="Qualcomm Atheros Open Powerline Toolkit for HomePlug AV"
arch=(i686 x86_64)
url=https://github.com/qca/open-plc-utils
license=(custom:Clear_BSD)
makedepends=(git)
_commit=bb50f635ef6cec8b52898051e0d18f4ac3fdd331
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
	mv "$pkgdir"/usr/bin/pev{,.plc}
	install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
