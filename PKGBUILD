# Maintainer: Jeremy Cochoy <jeremy.cochoy@gmail.com>
pkgname=sednl
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Simple Event Driven Network Library (C++11)"
arch=('i686' 'x86_64')
url="http://sednl.zenol.fr"
license=('ZLIB')
groups=()
depends=()
makedepends=(cmake)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=
changelog=
source=("http://sednl.zenol.fr/download/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('29f32df02f9f0482798e39a438e99a04')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake ..
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBACKEND_EPOLL=ON .
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
	ln -s /usr/lib/libsednl-1.0.a $pkgdir/usr/lib/libsednl.a
	ln -s /usr/lib/libsednl-1.0.so $pkgdir/usr/lib/libsednl.so
	mkdir -p "$pkgdir/usr/share/licenses/sednl/"
	cp "../LICENSE" $pkgdir/usr/share/licenses/sednl/
}
