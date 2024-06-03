# Maintainer: GustavoWidman <gustavowidman@gmail.com>

pkgname=passmake
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple password generator written in Go."
arch=('any')
url="https://github.com/GustavoWidman/passmake"
license=('CC0')
depends=()
makedepends=('go' 'git')
options=('!strip' '!debug')

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

	go mod tidy

	go build -o "$srcdir/$pkgname/passmake" -ldflags "-s -w" ./src/main.go

	rm -f go.mod go.sum
}

package() {
	install -Dm755 "$srcdir/$pkgname/passmake" "$pkgdir/usr/bin/passmake"
}
