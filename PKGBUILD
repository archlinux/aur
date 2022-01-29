# Maintainer: Oliver Giles <web ohwg net>
pkgname=laminar
pkgver=1.2
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
backup=('etc/laminar.conf')
md5sums=('4a397e7e1854f90f509cc649aecc5baf')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DLAMINAR_VERSION=$pkgver -DSYSTEMD_UNITDIR=/usr/lib/systemd/system .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin/laminard" "$pkgdir/usr/bin/laminard"
	rmdir "$pkgdir/usr/sbin"
}

