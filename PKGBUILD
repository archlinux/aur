# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >

pkgname=libimobiledevice-git
epoch=1
pkgver=1.1.0.r789.g9f79242
pkgrel=1
pkgdesc="Library that talks the protocols to support iPhone and iPod Touch devices on Linux"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('libusbmuxd' 'usbmuxd' 'gnutls')
makedepends=('python' 'cython' 'libplist' 'autoconf-archive'
             'git' 'python-setuptools')
provides=('libiphone-git' 'libiphone' 'libimobiledevice')
conflicts=('libiphone-git' 'libiphone' 'libimobiledevice')
source=("git+https://github.com/libimobiledevice/libimobiledevice")
sha256sums=('SKIP')

pkgver() {
	cd libimobiledevice
	git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd libimobiledevice
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libimobiledevice
	./configure --prefix=/usr --disable-openssl
	make
}

package() {
	cd libimobiledevice
	make DESTDIR="$pkgdir" install
}
