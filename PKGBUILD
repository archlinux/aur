# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='libnsutils-git'
pkgver=0.1.0.r0.g142a794
pkgrel=1
pkgdesc='NetSurf Utilities'
url='http://source.netsurf-browser.org/libnsutils.git/'
license=('MIT')

makedepends=('git' 'netsurf-buildsystem-git')
provides=('libnsutils')
conflicts=('libnsutils')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libnsutils.git')
sha256sums=('SKIP')

pkgver() {
	cd libnsutils
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libnsutils/Makefile
}

build() {
	make -C libnsutils PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libnsutils
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/libnsutils"
}
