# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=yacasl2
pkgver=0.5p2
pkgrel=1
pkgdesc="A CASL II processing system"
arch=('x86_64')
url="https://github.com/j8takagi/YACASL2"
license=('MIT')
depends=('glibc')
source=("https://github.com/j8takagi/YACASL2/archive/v$pkgver.tar.gz"
        "Makefile.patch")
sha256sums=("c4cfb58568f0e49dc16cd99cbb33a0f16f090d53f79b4a62835ef683f282b37e"
            "26c19ad47a56e355a89ef14caba0061c1d498853c45cbedc45e7c3e644bbafbc")

prepare() {
	mv "${pkgname^^}-$pkgver" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	patch -p0 -i "$srcdir/Makefile.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make install prefix="$pkgdir/usr"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
