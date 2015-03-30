# -*- shell-script -*-
# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=crosstool-ng-git
pkgver=1.20.0.86.gd74f1cc
pkgrel=2
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

	git describe --long --tags | sed -r -e 's|^crosstool-ng-||' -e 's|-|.|g'
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
