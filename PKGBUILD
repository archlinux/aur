# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=go-exp-git
pkgver=r601.4513512a
pkgrel=1
pkgdesc="Experimental and unreliable tools for the Go programming language."
arch=('any')
url="https://github.com/golang/exp"
license=('BSD')
makedepends=('go')
source=("git+https://go.googlesource.com/exp")
sha512sums=('SKIP')

pkgver() {
	cd exp
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p bin
}

build() {
	cd exp
	go build \
		-o="../bin" \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		./...
}

package() {
	install -Dm755 bin/* -t "$pkgdir/usr/bin"
	cd exp
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
