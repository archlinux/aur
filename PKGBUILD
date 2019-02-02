# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=curl-inject-opt
pkgver=0.1.0
pkgrel=1
pkgdesc="run a command with modified CURL options"
license=(BSD)
arch=(x86_64 i686)

source=("$pkgname-$pkgver.tar.gz::https://github.com/de-vri-es/curl-inject-opt/archive/$pkgver.tar.gz")
sha512sums=('29e6feacbd73b807c91f01f8d64d904f14c4e3161f15d6ae732c5eecc5deaf46f7179d53ab5f9a8611d060a55a269672d581ab19e9d42e571cc9d87ade86dd96')

prepare() {
	mkdir "$srcdir/build"
	cd    "$srcdir/build"
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
