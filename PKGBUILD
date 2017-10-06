# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=mstd
pkgver=1.1.v1
pkgrel=1
pkgdesc="Stuff that could be in std::, but is not"
arch=('any')
url='https://github.com/m-ou-se/mstd'
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/mstd/archive/cmake.tar.gz")
sha512sums=('0e6f3b6eded1ff2c918c1802f8a08a7cacb49a699bb81384761ee60ff05d71ceb0be1754af2a4869642ee1a4abd356d12a92a11e5d9f3db6f24864480438625b')

prepare() {
	rm -rf "$srcdir/build"
	mkdir "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$pkgname-cmake" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-cmake/COPYING"
}
