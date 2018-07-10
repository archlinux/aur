# Maintainer: Matt Boehlke (mtboehlke <at> gmail <dot> com)
pkgname=rgbpaint
pkgver=0.8.7
pkgrel=3
pkgdesc="Very simple pixel-based painting program"
arch=('i686' 'x86_64')
url="http://mtpaint.sourceforge.net/rgbpaint.html"
license=('GPL2')
depends=('gtk2')
source=("https://sourceforge.net/projects/mtpaint/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'configure.patch')
sha1sums=('826fe5e1cb770f38beadacc73399ef965bc3d10c'
	'80b699893db13dec7e9623dea46739315deed654')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Nbup1 -i "$srcdir/configure.patch"
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
