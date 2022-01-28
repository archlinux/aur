# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='libnsbmp-git'
pkgver=0.1.6.r0.g3155a7e
pkgrel=1
pkgdesc='Decoding library for BMP and ICO image file formats'
url='http://www.netsurf-browser.org/projects/libnsbmp/'
license=('MIT')

makedepends=('git' 'netsurf-buildsystem-git')
provides=('libnsbmp')
conflicts=('libnsbmp')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libnsbmp.git')
sha256sums=('SKIP')

pkgver() {
	cd libnsbmp
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libnsbmp/Makefile
}

build() {
	cd libnsbmp
	make PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libnsbmp
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/libnsbmp"
}
