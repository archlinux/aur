# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >

pkgname=libimobiledevice-git
epoch=1
pkgver=1.2.0.r149.gaf91dc6
pkgrel=1
pkgdesc="Library that talks the protocols to support iPhone and iPod Touch devices on Linux"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('libusbmuxd-git' 'usbmuxd-git' 'gnutls')
makedepends=('python' 'cython' 'libplist-git' 'autoconf-archive'
             'git' 'python-setuptools')
provides=('libiphone-git' 'libiphone' 'libimobiledevice')
conflicts=('libiphone-git' 'libiphone' 'libimobiledevice')
source=("git+https://git.libimobiledevice.org/libimobiledevice.git")
sha512sums=('SKIP')

pkgver() {
	cd libimobiledevice

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd libimobiledevice

	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libimobiledevice

	./configure --prefix=/usr --disable-openssl
	#sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
	make
}

package() {
	cd libimobiledevice

	make DESTDIR="$pkgdir" install
}
