# Maintainer: Soma Zambelly <zambelly.soma@gmail.com>
pkgname=reveng
pkgver=3.0.6
pkgrel=2
pkgdesc="Arbitrary-precision CRC calculator and algorithm finder"
arch=(x86_64)
url="http://reveng.sourceforge.net/"
license=('GPL')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.xz/download")
sha256sums=("aab479af6404daa27bce6725114e28a84b60e4e00c0f6fb021d2b9de8b2b4e4c")

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
