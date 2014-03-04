# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Adam Eberlin < ae at adameberlin dot com >

pkgname=libplist-git
epoch=1
pkgver=1.10.29.g6dcc8c4
pkgrel=2
pkgdesc="A library to handle Apple Property List format whereas it's binary or XML"
url="http://www.libimobiledevice.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'libxml2')
makedepends=('gcc' 'git' 'make' 'cmake' 'swig')
provides=('libplist')
conflicts=('libplist')

source=("git://git.sukimashita.com/libplist.git")
md5sums=('SKIP')

pkgver() {
	cd libplist

	git describe --long | sed -r -e 's|-|.|g'
}

build() {
	cd libplist

	PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
	make || make -j1 # it could break/choke on building the final library... HACK
}

package() {
	cd libplist

	make DESTDIR="${pkgdir}" install
}
