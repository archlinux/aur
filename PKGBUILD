# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=asmfmt
pkgver=1.3.2
pkgrel=1
pkgdesc="Format your assembler code in a similar way that gofmt formats your Go code."
arch=('any')
url="https://github.com/klauspost/asmfmt"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('532c41b0b325989124677dd863e11e80b7b06183a66d414d69b86d123eb3ae28f6bf9c488519072a324c695f42ee5a6cacd15c53ae738e666639d577ce4d8276')

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
