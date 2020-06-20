# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=libirecovery-git
epoch=2
pkgver=1.0.0.r1.gfbcfbf2
pkgrel=1
pkgdesc="Library and utility to talk to iBoot/iBSS via USB"
arch=('i686' 'x86_64')
url="http://www.libimobiledevice.org/"
license=('LGPL2.1')
depends=('libusb' 'readline')
makedepends=('git')
provides=("libirecovery")
conflicts=("libirecovery")
source=("git+https://github.com/libimobiledevice/libirecovery")
md5sums=('SKIP')

pkgver() {
	cd libirecovery
	git describe --long --tags | sed -r -e 's/-/.r/;s/-/./'
}

prepare() {
	cd libirecovery
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libirecovery
	./configure --prefix=/usr
	make
}

package() {
	cd libirecovery

	make DESTDIR="$pkgdir" install
}
