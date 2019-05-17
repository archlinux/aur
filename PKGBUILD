# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=estd
pkgdesc="Extended C++ library in the style of the standard library"
url="https://github.com/fizyr/estd"
pkgver=0.3.1
pkgrel=1
makedepends=(cmake)
arch=(x86_64)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/fizyr/estd/archive/$pkgver.tar.gz")
sha512sums=('e014dace36e85e5b9e292bc96afa786c9e4ba807ed5087aba4d9184ee4e64680b7efd9b74514ccb1c1d02b74d70be1acc9181b16c94e0a1cf8738bebf8977d71')

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
