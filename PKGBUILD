# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=libplist-git
epoch=1
pkgver=1.12.r83.g5b0184a
pkgrel=1
pkgdesc="A library to handle Apple Property List format whereas it's binary or XML"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'libxml2' 'python2')
makedepends=('gcc' 'git' 'make' 'cmake' 'swig')
provides=('libplist')
conflicts=('libplist')
source=("git+https://git.libimobiledevice.org/libplist.git")
md5sums=('SKIP')

pkgver() {
	cd libplist

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd libplist

	PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
	make
}

package() {
	cd libplist

	make DESTDIR="$pkgdir" install
}
