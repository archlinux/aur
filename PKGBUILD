# Maintainer: Soma Zambelly <zambelly.soma@gmail.com>
pkgname=reveng
pkgver=3.0.5
pkgrel=1
pkgdesc="Arbitrary-precision CRC calculator and algorithm finder"
arch=(x86_64)
url="http://reveng.sourceforge.net/"
license=('GPL')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.xz/download")
sha256sums=("446c9a49c563b99e2bbebadbd399e9860a6ef05cc140ab9e32217dd7b5276ba0")

build() {
	cd "$pkgname-$pkgver"
	sed -i 's/#define BMP_BIT   32/#define BMP_BIT   64/' config.h
	sed -i 's/#define BMP_SUB   16/#define BMP_SUB   32/' config.h
	sed -i 's/-$(STRIP) $(SFLAGS) $@ $@$(EXT)/-$(STRIP) $(SFLAGS) $@/' Makefile
	make
}

package() {
	cd "$pkgdir"
	install -D "$srcdir/$pkgname-$pkgver/reveng" usr/bin/reveng
}
