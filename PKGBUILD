# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Jhon Diaz <electimon@gmail.com>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libideviceactivation-git
epoch=1
pkgver=1.1.1.r17.gecc10ef
pkgrel=1
pkgdesc="Activates iDevices using a single tool."
arch=('i686' 'x86_64')
url="http://github.com/libimobiledevice/libideviceactivation"
license=('LGPL-2.1-only' 'GPL-3.0-only')
depends=('curl' 'libxml2' 'libplist-git' 'libimobiledevice-git')
makedepends=('git')
provides=(libideviceactivation-1.0.so "libideviceactivation=$pkgver")
conflicts=('libideviceactivation')
source=("git+https://github.com/libimobiledevice/libideviceactivation")
md5sums=('SKIP')

pkgver() {
	cd libideviceactivation
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd libideviceactivation
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libideviceactivation
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd libideviceactivation
	make DESTDIR="$pkgdir" install
}

