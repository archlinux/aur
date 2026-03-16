# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=curl-inject-opt
pkgver=0.2.4
pkgrel=1
pkgdesc="run a command with modified CURL options"
url="http://github.com/de-vri-es/curl-inject-opt"
license=(BSD-2-Clause)
arch=(x86_64 i686)

makedepends=(cargo)
depends=(glibc libgcc)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/curl-inject-opt/archive/v$pkgver.tar.gz")
sha512sums=('8fedd1a08cf5bec48ff363a09a19936892a8088579ed69de4d5f2dbfc547846a8f152746edddcbe4cd5cd794385d1ebebd27e38cfd1961c9896a6dbfc9c3a9fe')

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
