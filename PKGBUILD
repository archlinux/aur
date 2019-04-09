# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=curl-inject-opt
pkgver=0.2.0
pkgrel=1
pkgdesc="run a command with modified CURL options"
license=(BSD)
arch=(x86_64 i686)

makedepends=(cargo)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/curl-inject-opt/archive/$pkgver.tar.gz")
sha512sums=('2a7ee2a39e2654bd3a9ef9b23fdb7170b52501ca2b989b49fcb08cc66233fcf121d2f072584733d3c8e57e54f5ba3d15817d1426cce38a503c0712f10ad18e2f')

prepare() {
	rm -rf "$srcdir/build"
	mkdir  "$srcdir/build"
	cd     "$srcdir/build"
	"../$pkgname-$pkgver/configure" PREFIX="/usr"
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m 664 -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
