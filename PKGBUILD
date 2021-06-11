# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=asmfmt
pkgver=1.3.1
pkgrel=1
pkgdesc="Format your assembler code in a similar way that gofmt formats your Go code."
arch=('any')
url="https://github.com/klauspost/asmfmt"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('9f9d6228698af6c5f3439ff3e3d7ecd2e4f4b3ba9522687250852cd2f8a33eb14046390afbee9edbc2c86db7fd22087d78ea2d699e1a88a449ad338e71401905')

build() {
	cd "${pkgname}-${pkgver}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		./cmd/asmfmt
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ${pkgname} -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
