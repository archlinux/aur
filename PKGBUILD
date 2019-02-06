# Maintainer: Nemo <archlinux [at] captnemo.in>

pkgname=karn
pkgver=0.0.4
pkgrel=2
pkgdesc="Manage multiple Git identities with ease"
arch=('x86_64' 'i686')
url="https://github.com/prydonius/karn"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')

source=("https://github.com/prydonius/karn/archive/v$pkgver.tar.gz")
sha256sums=('68d244558ef62cf1da2b87927a0a2fbf907247cdd770fc8c84bf72057195a6cb')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src"

	export GOPATH="$srcdir/go"

	mv "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/$pkgname"

	cd "$srcdir/go/src/$pkgname/"

	go get

	go build cmd/karn/karn.go
}

package() {
	install -DT "$srcdir/go/src/$pkgname/$pkgname" "$pkgdir/usr/bin/karn"
}
