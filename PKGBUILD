# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gabriel Martinez < reitaka at gmail dot com >
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=libplist-git
epoch=1
pkgver=2.3.0.r19.gd45396a
pkgrel=1
pkgdesc="A library to handle Apple Property List format whereas it's binary or XML"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=('gcc-libs' 'glibc')
makedepends=('python' 'cython' 'git')
optdepends=('python: for the Python bindings')
provides=(libplist-2.0.so libplist++-2.0.so "libplist=$pkgver")
conflicts=('libplist')
source=("git+https://github.com/libimobiledevice/libplist")
sha256sums=('SKIP')

pkgver() {
	cd libplist
	git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd libplist
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libplist
	./configure --prefix=/usr
	make
}

check() {
	cd libplist
	make check
}

package() {
	cd libplist
	make DESTDIR="$pkgdir" install
}
