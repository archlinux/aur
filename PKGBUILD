# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=stringpool
pkgver=0.0.p3
pkgrel=1
pkgdesc="C++ string pool"
arch=('any')
url='https://github.com/m-ou-se/stringpool'
license=()

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/stringpool/archive/$pkgver.tar.gz")
sha512sums=('59090b55a6cbc897399937a246ef6cf3995043876027b45d40562de58b76acfe4cceacdea204edf9faf1975909a2bdd8f03a7f10814506439629de0fb8b383bd')

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
