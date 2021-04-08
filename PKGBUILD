# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=asmfmt
pkgver=1.3.0
pkgrel=1
pkgdesc="Format your assembler code in a similar way that gofmt formats your Go code."
arch=('any')
url="https://github.com/klauspost/asmfmt"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('0f88eda2d9caa340fbcf7bdd40dfe818ff8615d210d3873903960b723f39c60a1c3815f17244732c2f198480f433ddfc3495b8079dd69e76962a5ae9ac432619')

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
