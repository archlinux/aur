# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=nomarch
pkgver=1.4
pkgrel=1
pkgdesc="Extract, list, and test files from the old '.arc' archive format"
arch=('x86_64')
url="http://www.svgalib.org/rus/nomarch.html"
license=('GPL2')
depends=('glibc')
source=("https://ibiblio.org/pub/Linux/utils/compress/$pkgname-$pkgver.tar.gz")
sha256sums=(fe20da34e0d3ba0cf6388701f44ac22224cf65130ddbc5fcbc27bc4949a6e1ad)

prepare() {
        cd "$pkgname-$pkgver"
	sed -i 's/-o nomarch/-o nomarch $(LDFLAGS)/' Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install
}
