# -*- shell-script -*-
# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=crosstool-ng-git
pkgver=1.1.0.2420.g1a8ca5b
pkgrel=1
pkgdesc="crosstool-NG aims at building toolchains."
arch=('i686' 'x86_64')
url="http://crosstool-ng.org/"
license=('GPL')
depends=('ncurses' 'gperf')
makedepends=('git' 'flex' 'bison')
provides=('crosstool-ng')
conflicts=('crosstool-ng')
source=('git://crosstool-ng.org/crosstool-ng')
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
