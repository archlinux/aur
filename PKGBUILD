# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-impl
pkgver=1.1.0
pkgrel=1
pkgdesc="Generate method stubs for implementing an interface."
arch=('any')
url="https://github.com/josharian/impl"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('aa8091cc76698da161f36413273c30e3709e440c3aea670df36d70c6e3c99a3966c20341585b271621adde26de47a2a28b92c8398cc8f8686c5faf829abed178')

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
