# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-honnef-tools
pkgver=0.2.2
pkgrel=1
pkgdesc="State of the art linter tooling for the Go programming language."
arch=('any')
url="https://honnef.co/go/tools"
license=('BSD')
makedepends=('go')
source=("https://github.com/dominikh/go-tools/archive/v${pkgver}.tar.gz")
sha512sums=('bb3e560a1b950b73290a6fa3a0395ab2cbe3f017a2e7443e3a523ea3dcdb473e89500e7af1266d76028f1e4e1b65f4a853725312b2fcfbaa907e09cac597409a')

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
