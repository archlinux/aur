# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=curl-inject-opt
pkgver=0.1.1
pkgrel=2
pkgdesc="run a command with modified CURL options"
license=(BSD)
arch=(x86_64 i686)

makedepends=(cargo)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/curl-inject-opt/archive/$pkgver.tar.gz")
sha512sums=('8ca5bb67e912592d21923b19bfeaacd530d9ed8718580eca2c1256d69488f827f16d83496e066488c61321d003b2bd312b6a0588246096b2016121d0cba16589')

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
