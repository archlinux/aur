# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=libimobiledevice-git
epoch=1
pkgver=1.1.0.587.ge229e28
pkgrel=2
pkgdesc="libimobiledevice is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('gnutls' 'libgcrypt' 'glib2' 'libplist-git' 'libusbmuxd-git')
makedepends=('git')
provides=('libiphone-git' 'libiphone' 'libimobiledevice')
conflicts=('libiphone-git' 'libiphone' 'libimobiledevice')
options=('libtool')

source=("git://git.sukimashita.com/libimobiledevice.git")
sha512sums=('SKIP')

pkgver() {
	cd libimobiledevice

	git describe --long | sed -r -e 's|-|.|g'
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
