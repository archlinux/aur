# Maintainer: Matt Boehlke (mtboehlke <at> gmail <dot> com)
pkgname=rgbpaint
pkgver=0.8.7
pkgrel=1
pkgdesc="Very simple pixel-based painting program"
arch=('i686' 'x86_64')
url="http://mtpaint.sourceforge.net/rgbpaint.html"
license=('GPL2')
depends=('gtk2')
source=("https://sourceforge.net/projects/mtpaint/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'configure.patch')
sha256sums=('90741335ce887a0bb27e3c36d6013cfdbfb37dc4a38c3790b3b0a8cb9ef46994'
	'5679a40035c61be7ff99fd74ba08f6d8122e897379b8589cdf7438b4a56c2fc6')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Nbp1 -i "$srcdir/configure.patch"
}

build() {
 	cd "$pkgname-$pkgver"
	./configure cflags man intl \
        	--prefix="$pkgdir/usr" \
        	--mandir="$pkgdir/usr/share/man/man1"
	make
}

package() {
 	cd "$pkgname-$pkgver"
	make install
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
