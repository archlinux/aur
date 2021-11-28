# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=gomodifytags
pkgver=1.16.0
pkgrel=1
pkgdesc="Go tool to modify struct field tags"
arch=('any')
url="https://github.com/fatih/gomodifytags"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f18b434cf9c79d5c5dc0b30bbc7e3646780f392838d9683edbf201358a8075dccb3e90aaca04b499a3f2345c52a94998845d6498a7f53b6264d15134d5fcd623')

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
