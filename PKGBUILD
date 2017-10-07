# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=mstd
pkgver=1.1.v1
pkgrel=2
pkgdesc="Stuff that could be in std::, but is not"
arch=('any')
url='https://github.com/m-ou-se/mstd'
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/mstd/archive/$pkgver.tar.gz")
sha512sums=('7399cdbc9fbcd27f37ab472a6d8d6647c371dc59364d8c73ceb7cb91483dbe818d3c07ef81ad7bb3854d8bf798ee931e550272d2de6178f13ee38b7cefb754cc')

prepare() {
	rm -rf "$srcdir/build"
	mkdir "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$pkgname-$pkgver" \
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
	install -m 644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/COPYING"
}
