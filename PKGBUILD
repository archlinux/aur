# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=estd
pkgdesc="Extended C++ library in the style of the standard library"
url="https://github.com/fizyr/estd"
pkgver=0.1.10
pkgrel=1
makedepends=(cmake)
arch=(x86_64)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/fizyr/estd/archive/$pkgver.tar.gz")
sha512sums=('2c1c58d1557d39f28a3f10498347ea62e4f0422d0151616cbb0bff9496809eb17913f41dacf9a3292d7f38d3cb26fa36d2debeb276c27e969ec932693f2b9b73')

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
