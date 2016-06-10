# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='libparserutils-git'
pkgver=0.2.3.r0.ga191c15
pkgrel=1
pkgdesc='Library for building efficient parsers'
url='http://www.netsurf-browser.org/projects/libparserutils/'
license=('MIT')

makedepends=('netsurf-buildsystem-git')
provides=('libparserutils')
conflicts=('libparserutils')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libparserutils.git')
sha256sums=('SKIP')

pkgver() {
	cd libparserutils
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libparserutils/Makefile
}

build() {
	cd libparserutils
	make PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

check() {
	make -C libparserutils PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test
}

package() {
	cd libparserutils
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/libparserutils"
}
