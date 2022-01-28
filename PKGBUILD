# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='libnsgif-git'
pkgver=0.2.1.r117.g3832f7e
pkgrel=1
pkgdesc='Decoding library for the gif image file format'
url='http://www.netsurf-browser.org/projects/libnsgif/'
license=('MIT')

makedepends=('git' 'netsurf-buildsystem-git')
provides=('libnsgif')
conflicts=('libnsgif')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libnsgif.git')
sha256sums=('SKIP')

pkgver() {
	cd libnsgif
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libnsgif/Makefile
}

build() {
	make -C libnsgif PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libnsgif
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/libnsgif"
}
