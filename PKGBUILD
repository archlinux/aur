# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >
# Contributor: Michael Gerhaeuser <michael dot gerhaeuser at gmail dot com>

pkgname=libusbmuxd-git
pkgver=2.0.2.r32.g30e678d
pkgrel=1
pkgdesc="A client library to multiplex connections from and to iOS devices"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('LGPL2.1' 'GPL2')
depends=('gcc-libs' 'glibc' 'libplist-git' 'libimobiledevice-glue-git')
makedepends=(git)
provides=(libusbmuxd-2.0.so "libusbmuxd=$pkgver")
conflicts=('libusbmuxd' 'usbmuxd<1.0.9')
source=("git+https://github.com/libimobiledevice/libusbmuxd")
sha512sums=('SKIP')

pkgver() {
	cd libusbmuxd
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
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
