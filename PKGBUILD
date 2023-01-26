# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=curl-inject-opt
pkgver=0.2.3
pkgrel=1
pkgdesc="run a command with modified CURL options"
license=(BSD)
arch=(x86_64 i686)

makedepends=(cargo)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/curl-inject-opt/archive/v$pkgver.tar.gz")
sha512sums=('f0db61c27fe59cffe53cfd48c7dbaff6ac17250be178b13b332544769e6ad5d8ba1db14d3cb82d33822c01f8afb7f587268db47bd0d9899e096410b53cc619ef')

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
