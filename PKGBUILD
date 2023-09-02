# Maintainer: Daniël van de Giessen <aur@dvdgiessen.nl>
pkgname=bytes-circle
pkgver=3.1
pkgrel=1
pkgdesc='Show byte statistics as an ASCII circle graph'
arch=('x86_64')
url='https://circulosmeos.wordpress.com/2015/10/10/statistics-circle-for-analysing-byte-entropy-in-files'
license=('GPL3')
depends=('glibc')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/circulosmeos/circle/archive/refs/tags/v$pkgver-$pkgrel-debian.tar.gz")
sha256sums=('334036bcd86e95a780595ad9805504b485f0f35e619aa5b16edc22ab1f6fb63f')

build() {
	cd "circle-$pkgver-$pkgrel-debian"
	chmod +x configure
	./configure --prefix=/usr
	make
}

check() {
	cd "circle-$pkgver-$pkgrel-debian"
	make -k check
}

package() {
	cd "circle-$pkgver-$pkgrel-debian"
	make DESTDIR="$pkgdir/" install
	install -D -m644 "debian/bytes-circle.1" "$pkgdir/usr/share/man/man1/bytes-circle.1"
}
