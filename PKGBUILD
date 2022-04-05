# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-honnef-tools
pkgver=0.3.0
pkgrel=1
pkgdesc="State of the art linter tooling for the Go programming language."
arch=('any')
url="https://honnef.co/go/tools"
license=('BSD')
makedepends=('go')
source=("https://github.com/dominikh/go-tools/archive/v${pkgver}.tar.gz")
sha512sums=('f2811d0231033825b36fcd0a49449f79459b58c6ddcacc38e92d42bb01adb020b53d67a6bc6e8cc9c9bbad8ba0850656c654f69e2cde3cc2870e61db014799be')

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
