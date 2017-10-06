# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=stringpool
pkgver=0.0.p2
pkgrel=1
pkgdesc="C++ string pool"
arch=('any')
url='https://github.com/m-ou-se/string-pool'
license=()

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/string-pool/archive/$pkgver.tar.gz")
sha512sums=('4282c9c48cb0081e6d370a23ecafcfecb9ff2ddc3f17507a2adf8385487ce2f613277ecb48379f21b5625c07d95f6e38be0ddbb3e5708e82314c89d9d7db1d3e')

prepare() {
	rm -rf "$srcdir/build"
	mkdir "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/string-pool-$pkgver" \
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
