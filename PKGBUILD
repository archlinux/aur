# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=libtatsu-git
pkgver=1.0.0.r0.g6fd8a51
pkgrel=1
pkgdesc="Library handling the communication with Apple's Tatsu Signing Server (TSS)"
url="http://www.libimobiledevice.org/"
arch=(x86_64)
license=('LGPL-2.1')
depends=('glibc' 'libplist-git')
makedepends=('git')
provides=(libtatsu.so "libtatsu=$pkgver")
conflicts=(libtatsu)
source=("git+https://github.com/libimobiledevice/libtatsu")
sha256sums=('SKIP')

pkgver() {
	cd libtatsu
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd libtatsu
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libtatsu
	./configure --prefix=/usr
	make
}

check() {
	cd libtatsu
	make check
}

package() {
	cd libtatsu
	make DESTDIR="$pkgdir" install
}
