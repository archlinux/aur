# -*- shell-script -*-
# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: goodmen <goodmenzy@gmail.com>

pkgname=crosstool-ng-git
epoch=1
pkgver=1.24.0.r507.g1b3d45df
pkgrel=1
pkgdesc="crosstool-NG aims at building toolchains."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://crosstool-ng.org/"
license=('GPL')
depends=('ncurses' 'make' 'rsync')
makedepends=('git' 'flex' 'bison' 'gperf' 'help2man' 'unzip' 'lzip' 'python')
provides=('crosstool-ng')
conflicts=('crosstool-ng')
source=('git://github.com/crosstool-ng/crosstool-ng.git')
b2sums=('SKIP')

pkgver() {
	cd crosstool-ng

  git describe --long --tags | sed 's/^crosstool-ng-//;s/-rc/rc/;s/-/.r/;s/-/./'
}

prepare () {
	cd crosstool-ng
	# add glibc version 2.35
  git pull --no-edit origin pull/1368/head
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
}
