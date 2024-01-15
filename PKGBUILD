# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=tapview
pkgver=1.10
pkgrel=1
pkgdesc="A tiny viewer/consumer for TAP (Test Anything Protocol)"
arch=(any)
url="https://gitlab.com/esr/tapview"
license=('custom:MIT0')
makedepends=(asciidoctor)
checkdepends=(shellcheck)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('3d661550687fe21e24305a220eab5d9edea8e6ebd17bebbbe1ae900f2964881ee55f8999ff147de70bfa1d399358d3ae91bdc21f25026f6fd91b8a8d8c7943e2')

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
