# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-honnef-tools
pkgver=0.3.2
pkgrel=1
pkgdesc="State of the art linter tooling for the Go programming language."
arch=('any')
url="https://honnef.co/go/tools"
license=('BSD')
makedepends=('go')
source=("https://github.com/dominikh/go-tools/archive/v${pkgver}.tar.gz")
sha512sums=('4215bddf2b2dbeb7295c79ca0ef9816882193bb7544ab9982525eb498c7a87b2c590b4623904cca67c2b672dbf5bf921a32105c15243178b9f226be4685b24dd')

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
