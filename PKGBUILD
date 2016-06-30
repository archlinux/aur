# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=libmbus-git
pkgver=0.8.0.r280.g6fd4ca2
pkgrel=1
pkgdesc="Meter-bus library and utility programs"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git')
optdepends=()
provides=('libmbus')
conflicts=('libmbus')
url="http://www.rscada.se/libmbus/"
source=('git://github.com/rscada/libmbus.git')
md5sums=('SKIP')

_gitname=libmbus

pkgver() {
	cd $srcdir/$_gitname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $srcdir/$_gitname
	sed -i -e 's#\./configure#\./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin#' build.sh
}

build() {
	cd $srcdir/$_gitname
	./build.sh
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR=$pkgdir install
}
