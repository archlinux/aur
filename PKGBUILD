# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=curl-inject-opt
pkgver=0.2.1
pkgrel=1
pkgdesc="run a command with modified CURL options"
license=(BSD)
arch=(x86_64 i686)

makedepends=(cargo)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/curl-inject-opt/archive/v$pkgver.tar.gz")
sha512sums=('1edecd7f3a24e29f108067777900af731290541a2b2e084acb4665d15a4e3fb28362955a8cd6ebbe53ab5e760aa50768f881551ccd8d76d0ffbf10ceadc847ab')

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
