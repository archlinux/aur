# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >
# Contributor: Michael Gerhaeuser <michael dot gerhaeuser at gmail dot com>

pkgname=libusbmuxd-git
pkgver=2.0.1.r3.g563cd25
pkgrel=1
pkgdesc="A client library to multiplex connections from and to iOS devices"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('LGPL2.1' 'GPL2')
depends=('libusb' 'libplist')
makedepends=('git')
provides=('libusbmuxd')
conflicts=('libusbmuxd' 'usbmuxd<1.0.9')
source=("git+https://github.com/libimobiledevice/libusbmuxd")
sha512sums=('SKIP')

pkgver() {
	cd libusbmuxd
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd libusbmuxd
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libusbmuxd
	./configure --prefix=/usr
	make
}

check() {
	cd libusbmuxd
	make check
}

package() {
	cd libusbmuxd
	make DESTDIR="$pkgdir" install
}
