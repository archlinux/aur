# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=estd
pkgdesc="Extended C++ library in the style of the standard library"
url="https://github.com/fizyr/estd"
pkgver=0.1.12
pkgrel=1
makedepends=(cmake)
arch=(x86_64)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/fizyr/estd/archive/$pkgver.tar.gz")
sha512sums=('f9c317ec438f2e4d6902f109c17ad46660829b8b5ea1fca8df4209398a27ffe81b179db67ae478cc8bb883777a9a2df31d33590e2294b0929fcf494e899b0017')

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
