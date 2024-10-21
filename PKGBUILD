# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=tapview
pkgver=1.14
pkgrel=1
pkgdesc="A tiny viewer/consumer for TAP (Test Anything Protocol)"
arch=(any)
url="https://gitlab.com/esr/tapview"
license=('custom:MIT0')
makedepends=(asciidoctor)
checkdepends=(shellcheck)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('ad1eb6e50430575a1b6e85252b21c5260a3836fcb1924b3e9152a5e4e892eb722d3a7bfd6eadbfa3ded40f73c69dcd17a8226cddaff0136d5f2bf86f718d062f')

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
	make DESTDIR="$pkgdir" prefix=/usr install
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE 
}
