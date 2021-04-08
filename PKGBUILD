# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-honnef-tools
pkgver=0.1.3
pkgrel=1
pkgdesc="State of the art linter tooling for the Go programming language."
arch=('any')
url="https://honnef.co/go/tools"
license=('BSD')
makedepends=('go')
source=("https://github.com/dominikh/go-tools/archive/v${pkgver}.tar.gz")
sha512sums=('01148c5156bd7d008224d26b4577b42e3da3651ea353d69d2f3c733afd8616492238276b042aca98a9523b749dca71ecb0b154ca1d2dedc74baf43f3688670c4')

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
	rm -f ../bin/staticheck
}

package() {
	install -Dm755 bin/* -t "$pkgdir/usr/bin"
	cd "go-tools-${pkgver}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
