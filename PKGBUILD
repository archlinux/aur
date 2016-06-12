# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='nsgenbind-git'
pkgver=0.3.r0.g93be211
pkgrel=2
pkgdesc='Decoding library for BMP and ICO image file formats'
url='http://git.netsurf-browser.org/nsgenbind.git/'
license=('MIT')

makedepends=('git' 'netsurf-buildsystem-git')
provides=('nsgenbind')
conflicts=('nsgenbind')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/nsgenbind.git')
sha256sums=('SKIP')

pkgver() {
	cd nsgenbind
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i nsgenbind/Makefile
}

build() {
	make -C nsgenbind PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib
}

check() {
	make -C nsgenbind PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib test
}

package() {
	cd nsgenbind
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/nsgenbind"
}
