# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=firmware-manager-git
pkgver=0.1.1.r0.g5b04786
pkgrel=1
pkgdesc="Generic framework and GTK UI for firmware updates from system76-firmware and fwupd"
arch=('x86_64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'openssl' 'libgudev')
makedepends=('git' 'rust')
optdepends=('fwupd' 'system76-firmware-daemon')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/pop-os/firmware-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make prefix=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install prefix=/usr

	ln -s /usr/bin/com.system76.FirmwareManager "$pkgdir/usr/bin/${pkgname%-git}"
}
