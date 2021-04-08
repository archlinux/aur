# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-impl
pkgver=1.0.0
pkgrel=1
pkgdesc="Generate method stubs for implementing an interface."
arch=('any')
url="https://github.com/josharian/impl"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e73499e30e98cb67f9195dbc6851751756d50e790017704f0ffd4ef0a2fc08ef6bea1423db77c95c26d211b58f88134fb72387ed3ae4116747378de92631fe3a')

prepare() {
	mkdir -p bin
}

build() {
	cd "${pkgname##go-}-${pkgver}"
	go build \
		-o="../bin" \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		./...
}

package() {
	install -Dm755 bin/* -t "$pkgdir/usr/bin"
	cd "${pkgname##go-}-${pkgver}"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
