# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
pkgname='libutf8proc-git'
pkgver=2.4.0.1.r0.g0d22740
pkgrel=1
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
url='http://git.netsurf-browser.org/libutf8proc.git/'
license=('MIT')

makedepends=('git' 'netsurf-buildsystem-git')
provides=('libutf8proc')
conflicts=('libutf8proc')

arch=('x86_64' 'i686')
source=('git://git.netsurf-browser.org/libutf8proc.git')
sha256sums=('SKIP')

pkgver() {
	cd libutf8proc
	git describe --long | sed 's:release/::; s:-\([0-9]\+\)-\([0-9]\+\)-:.\1.r\2.:'
}

prepare() {
	sed 's:-D_BSD_SOURCE::' -i libutf8proc/Makefile
}

build() {
	make -C libutf8proc PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

package() {
	cd libutf8proc
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 LICENSE.md \
		"$pkgdir/usr/share/licenses/netsurf/libutf8proc"
}
