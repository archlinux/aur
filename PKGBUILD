# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=tapview
pkgver=1.15
pkgrel=1
pkgdesc="A tiny viewer/consumer for TAP (Test Anything Protocol)"
arch=(any)
url="https://gitlab.com/esr/tapview"
license=('custom:MIT0')
makedepends=(asciidoctor)
checkdepends=(shellcheck)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('9666afccc42f6aff65856ab222d882d82fd86dce8b0bd0ed02a2ad6d3b745f3e96956bb8d9201ca5414fae6a48eb8cb726b1e2e069d677636cc6186fd5dc83f7')

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
