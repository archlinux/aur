# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=gomodifytags
pkgver=1.13.0
pkgrel=1
pkgdesc="Go tool to modify struct field tags"
arch=('any')
url="https://github.com/fatih/gomodifytags"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b47b05203f11731dac2dacdb0c725ff822915f1d4801cbc761ad34e3a2a70abc4feb22caefdc54c2c04b76754edf1d7eebc50b6224b51492db588668330217ed')

prepare() {
	mkdir -p bin
}

build() {
	cd "${pkgname}-${pkgver}"
	go build \
		-o="../bin" \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		./...
}

package() {
	install -Dm755 bin/* -t "$pkgdir/usr/bin"
	cd "${pkgname}-${pkgver}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
