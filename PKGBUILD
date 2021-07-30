# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-honnef-tools
pkgver=0.2.0
pkgrel=2
pkgdesc="State of the art linter tooling for the Go programming language."
arch=('any')
url="https://honnef.co/go/tools"
license=('BSD')
makedepends=('go')
source=("https://github.com/dominikh/go-tools/archive/v${pkgver}.tar.gz")
sha512sums=('98649bd9f35f8b69c48b3d57a7c979c81ba7fe29bcff710689184702b46e96677efb0a8ccc589e20ea803216464d3388d306d5034180b49328d9c3066c306207')

prepare() {
	mkdir -p bin
}

build() {
	cd "go-tools-${pkgver}"
	go build \
		-o="../bin" \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		./...
}

package() {
	install -Dm755 bin/* -t "$pkgdir/usr/bin"
	rm "$pkgdir/usr/bin/staticcheck"
	cd "go-tools-${pkgver}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
