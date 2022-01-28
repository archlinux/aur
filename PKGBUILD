# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='libwapcaplet-git'
pkgver=0.4.3.r0.gb5e42b1
pkgrel=1
pkgdesc='String internment library with rapid string comparison'
url='http://www.netsurf-browser.org/projects/libwapcaplet/'
license=('MIT')

makedepends=('git' 'netsurf-buildsystem-git')
provides=('libwapcaplet')
conflicts=('libwapcaplet')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libwapcaplet.git')
sha256sums=('SKIP')

pkgver() {
	cd libwapcaplet
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libwapcaplet/Makefile
}

build() {
	make -C libwapcaplet PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libwapcaplet
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/libwapcaplet"
}
