# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=errcheck
pkgver=1.6.0
pkgrel=1
pkgdesc="A program for checking for unchecked errors in go programs."
arch=('any')
url="https://github.com/kisielk/errcheck"
license=('BSD')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ae150e67c3b81fb7ffbaf417bd4e876bbfc58868d965302f5370fd911d5692db0244aae160938ec9155cadda5976f6e14ab91f4fd4bf787fddd1e488a3218eff')

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
