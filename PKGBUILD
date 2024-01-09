# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=tapview
pkgver=1.9
pkgrel=1
pkgdesc="A tiny viewer/consumer for TAP (Test Anything Protocol)"
arch=(any)
url="https://gitlab.com/esr/tapview"
license=('custom:MIT0')
makedepends=(asciidoctor)
checkdepends=(shellcheck)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('8cf2a519e31f2c5d8eb86f7688386b1dcd64decee723e82dee6e1c96347dabb7d1d8fca7c1b668c2a2d5bc8bffd4b6996eb659a7aa5f30036773986db6278e89')

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
