# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname=libimobiledevice-git
epoch=1
pkgver=1.2.0.r52.g45fda81
pkgrel=2
pkgdesc="libimobiledevice is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('gnutls' 'openssl' 'libgcrypt' 'libplist-git' 'libusbmuxd-git')
makedepends=('git')
provides=('libiphone-git' 'libiphone' 'libimobiledevice')
conflicts=('libiphone-git' 'libiphone' 'libimobiledevice')
# it should be a proper dependency, but many tools complain about cyclic deps
optdepends=('usbmuxd-git: needed in runtime to actually use libimobiledevice')

source=("git+https://git.libimobiledevice.org/libimobiledevice.git")
sha512sums=('SKIP')

pkgver() {
	cd libimobiledevice

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd libimobiledevice

#	find . -type f -exec sed -re 's|SSLv3_method\(|SSLv23_method\(|g' -i {} \;
}

build() {
	cd libimobiledevice

	PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
	make
}

package() {
	# see above
	#depends+=('usbmuxd-git')

	cd libimobiledevice

	make DESTDIR="$pkgdir" install
}
