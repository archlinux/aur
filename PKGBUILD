# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=usbmuxd-git
epoch=1
pkgver=1.1.0.r25.g35e5d48
pkgrel=1
pkgdesc="USB Multiplex Daemon"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libusb' 'libplist-git' 'libimobiledevice-git')
makedepends=('git' 'cmake')
provides=('usbmuxd')
conflicts=('usbmuxd')
install='usbmuxd.install'
source=("git+https://git.libimobiledevice.org/usbmuxd.git")
sha512sums=('SKIP')

pkgver() {
	cd usbmuxd

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd usbmuxd

	./autogen.sh --prefix=/usr --sbindir=/usr/bin --with-systemd
	make
}

package() {
	cd usbmuxd

	make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2:
