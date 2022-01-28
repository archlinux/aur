# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='nsgenbind-git'
pkgver=0.8.r1.gecdd703
pkgrel=1
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

package() {
	cd nsgenbind
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/netsurf/nsgenbind"
}
