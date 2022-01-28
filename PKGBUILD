# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='libdom-git'
pkgver=0.4.1.r18.gade633d
pkgrel=1
pkgdesc='Implementation of the W3C DOM'
url='http://www.netsurf-browser.org/projects/libdom/'
license=('MIT')

depends=('libhubbub-git' 'libwapcaplet-git' 'wget')
makedepends=('git' 'netsurf-buildsystem-git')
provides=('libdom')
conflicts=('libdom')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libdom.git')
sha256sums=('SKIP')

pkgver() {
	cd libdom
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libdom/Makefile
}

build() {
	make -C libdom PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libdom
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/netsurf/libdom"
}
