# -*- shell-script -*-
# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=crosstool-ng-git
epoch=1
pkgver=1.20.0.r86.gd74f1cc
pkgrel=1
pkgdesc="crosstool-NG aims at building toolchains."
arch=('i686' 'x86_64')
url="http://crosstool-ng.org/"
license=('GPL')
depends=('ncurses' 'make')
makedepends=('git' 'flex' 'bison' 'gperf')
provides=('crosstool-ng')
conflicts=('crosstool-ng')
source=('git://github.com/crosstool-ng/crosstool-ng')
md5sums=('SKIP')

pkgver() {
	cd crosstool-ng

	git describe --long --tags | sed 's/^crosstool-ng-//;s/-/.r/;s/-/./'
}

build () {
	cd crosstool-ng

	./bootstrap
	./configure --prefix=/usr
	make
}

package () {
	cd crosstool-ng

	make DESTDIR="$pkgdir" install
	install -Dm644 ct-ng.comp "$pkgdir/etc/bash_completion.d/ct-ng"
}
