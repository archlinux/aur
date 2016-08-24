# Maintainer: Alessio Biancalana <dottorblaster@gmail.com>
pkgname=pacnews
pkgver=1.0.0
pkgrel=1
pkgdesc="Read Arch News from your CLI"
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/dottorblaster/pacnews"
makedepends=('go' 'git')
source=("https://github.com/dottorblaster/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('3a78d8da47d5552b00966c330d16d08b')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	rm -rf "$srcdir/.go/src"
	mkdir -p "$srcdir/.go/src"
	export GOPATH="$srcdir/.go"

	go get github.com/fatih/color
	go get github.com/SlyMarbo/rss
	go get github.com/kennygrant/sanitize

	go build pacnews.go
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -DT "pacnews" "$pkgdir/usr/bin/pacnews"
}
