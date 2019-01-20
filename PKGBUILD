# Maintainer: Oliver Giles <web ohwg net>
pkgname=laminar
pkgver=0.6
pkgrel=3
pkgdesc="Fast and lightweight Continuous Integration server"
arch=('i686' 'x86_64' 'armv7h')
url="https://laminar.ohwg.net"
license=('GPL3')
groups=()
depends=('capnproto>=0.7' 'sqlite' 'boost-libs')
makedepends=('cmake' 'boost' 'rapidjson' 'websocketpp')
options=('strip')
source=("https://github.com/ohwgiles/laminar/archive/$pkgver.tar.gz")
install=laminar.install
md5sums=('0227ce523eef0605b10cbda30ad605d9')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed 's/-std=c++11/-std=c++14/' -i CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/ -DSYSTEMD_UNITDIR=/usr/lib/systemd/system .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

