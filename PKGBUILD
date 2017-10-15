# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=stringpool
pkgver=0.0.p4
pkgrel=1
pkgdesc="C++ string pool"
arch=('any')
url='https://github.com/m-ou-se/stringpool'
license=()

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/stringpool/archive/$pkgver.tar.gz")
sha512sums=('1bb73b31a165641c9ad46e865c4200bde3efa41c74037d70eb05294863ec21310022f9348f02d33a95fb626bbf8d2a6ab5fd846458d0dee8c20c2b41c976c7d1')

prepare() {
	rm -rf "$srcdir/build"
	mkdir "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/stringpool-$pkgver" \
		-DBUILD_SHARED_LIBS=ON \
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
}
