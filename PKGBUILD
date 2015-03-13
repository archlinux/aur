# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=libimobiledevice-git
epoch=1
pkgver=1.2.0.r2.g1ff3448
pkgrel=2
pkgdesc="libimobiledevice is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('gnutls' 'openssl' 'libgcrypt' 'libplist-git' 'libusbmuxd-git')
makedepends=('git')
provides=('libiphone-git' 'libiphone' 'libimobiledevice')
conflicts=('libiphone-git' 'libiphone' 'libimobiledevice')

source=("git://git.sukimashita.com/libimobiledevice.git")
sha512sums=('SKIP')

pkgver() {
	cd libimobiledevice

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd libimobiledevice

	PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
	make
}

package() {
	cd libimobiledevice

	make DESTDIR="$pkgdir" install
}
