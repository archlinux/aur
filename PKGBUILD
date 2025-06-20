# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=ncx
pkgver=0.0.0
pkgrel=1
pkgdesc="CLI tool for system management and configuration"
arch=('x86_64')
url="https://gitlab.com/nathanchere/ncx"
license=('Apache-2.0')
depends=()
makedepends=('go' 'git' 'make')
source=("git+https://gitlab.com/nathanchere/ncx.git")
sha256sums=('SKIP')
options=('!strip' '!emptydirs')

pkgver() {
	cd "$srcdir/$pkgname"
	make build
	./bin/ncx version | sed 's/^v//'
}

prepare() {
	cd "$srcdir/$pkgname"
	make setup
}

build() {
	cd "$srcdir/$pkgname"
	make build
}

check() {
	cd "$srcdir/$pkgname/src"
	go test ./...
}

package() {
	cd "$srcdir/$pkgname"
	
	install -Dm755 bin/ncx "$pkgdir/usr/bin/ncx"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 