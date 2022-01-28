# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
# Contributor: Alexander Rodseth <rodseth@gmail.com>
# Contributor: Torjus Haakestad <torjuspuz@gmail.com>
pkgname='libhubbub-git'
pkgver=0.3.7.r19.g873ed6e
pkgrel=1
pkgdesc='HTML5 compliant parsing library'
url='http://www.netsurf-browser.org/projects/hubbub/'
license=('MIT')

depends=('libparserutils-git' 'libxslt' 'wget')
makedepends=('git' 'netsurf-buildsystem-git' 'gperf')
provides=('libhubbub')
conflicts=('libhubbub')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libhubbub.git')
sha256sums=('SKIP')

pkgver() {
	cd libhubbub
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-:.r\1.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libhubbub/Makefile
}

build() {
	make -C libhubbub PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libhubbub
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/netsurf/libhubbub"
}
