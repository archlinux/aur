# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=estd
pkgdesc="Extended C++ library in the style of the standard library"
url="https://github.com/fizyr/estd"
pkgver=0.1.11
pkgrel=1
makedepends=(cmake)
arch=(x86_64)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/fizyr/estd/archive/$pkgver.tar.gz")
sha512sums=('dd077e05a2540a541d291eee63f78ca8f5cdbf19c7bbf2fc5da3a89739625326c07b811774393ab80d67d79be5cf99be8f9c0b6522b22d80c5a4dff852beacc0')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DUSE_CATKIN=OFF \
		-DCMAKE_BUILD_TYPE=Release
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
}
