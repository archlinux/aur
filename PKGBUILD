# Maintainer: Soma Zambelly <zambelly.soma@gmail.com>
pkgname=reveng
pkgver=2.1.1
pkgrel=2
pkgdesc="Arbitrary-precision CRC calculator and algorithm finder"
arch=(x86_64)
url="http://reveng.sourceforge.net/"
license=('GPL')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.xz/download")
sha256sums=("75261d473b32847df5f0be1837edc89abbaae87c8a81564dd7cb2af340bf8cb1")

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
