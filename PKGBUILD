# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=open-plc-utils
pkgver=r502.gd2cd8f70
pkgrel=1
pkgdesc="Qualcomm Atheros Open Powerline Toolkit for HomePlug AV"
arch=(i686 x86_64)
url=https://github.com/qca/open-plc-utils
license=(custom:Clear_BSD)
_commit=d2cd8f70498302c8691dd34841ac14a2e1bc8b1f
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
