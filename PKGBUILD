# Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='libutf8proc-git'
pkgver=1.3.1.2.r0.g81ce692
pkgrel=1
pkgdesc='C library for processing UTF-8 encoded Unicode strings'
url='http://git.netsurf-browser.org/libutf8proc.git/'
license=('MIT')

makedepends=('netsurf-buildsystem-git')
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
	cd libutf8proc
	make PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared
}

check() {
	make -C libutf8proc PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared test
}

package() {
	cd libutf8proc
	make DESTDIR="$pkgdir" PREFIX=/usr INCLUDEDIR=include \
		LIBDIR=lib COMPONENT_TYPE=lib-shared install
	install -Dm644 LICENSE.md \
		"$pkgdir/usr/share/licenses/netsurf/libutf8proc"
}
