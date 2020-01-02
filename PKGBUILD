# Maintainer: Oliver Giles <web ohwg net>
pkgname=laminar
pkgver=0.8
pkgrel=1
pkgdesc="Fast and lightweight Continuous Integration server"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://laminar.ohwg.net"
license=('GPL3')
groups=()
depends=('capnproto>=0.7' 'sqlite')
makedepends=('cmake' 'boost' 'rapidjson')
options=('strip')
source=("https://github.com/ohwgiles/laminar/archive/$pkgver.tar.gz")
install=laminar.install
md5sums=('0596efb88ad4d3b76dfd5fb29c6beeac')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/ -DSYSTEMD_UNITDIR=/usr/lib/systemd/system .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin/laminard" "$pkgdir/usr/bin/laminard"
	rmdir "$pkgdir/usr/sbin"
}

