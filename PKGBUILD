# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=mstd
pkgver=1.1.v2
pkgrel=2
pkgdesc="Stuff that could be in std::, but is not"
arch=('any')
url='https://github.com/m-ou-se/mstd'
license=('BSD')

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/mstd/archive/$pkgver.tar.gz")
sha512sums=('ea152f653e2a29e158efe574cfbe07487b614aadb1cdac38fd3edef58ca6a5a0fd589efbd29baa94fa63affae4cfb07faeecb8134699650f2679748d309aa093')

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
