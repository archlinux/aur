# Maintainer: Bryn Edwards <bryn@protonmail.ch>

pkgname=antibody
pkgver=3.1.4
pkgrel=2
pkgdesc="A faster and simpler antigen written in Golang."
arch=('i686' 'x86_64')
url="https://getantibody.github.io/"
license=('MIT')
depends=('zsh')
makedepends=('go')
source=("https://github.com/getantibody/antibody/archive/v${pkgver}.tar.gz")
sha256sums=('978aec1332e1a6b4a9860d5d86571b8921edce2682479e6132c59b0364e67b4d')

prepare() {
	mkdir -p "$srcdir/.go"
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "5s/dev/$pkgver/" main.go
}

build() {
	export GOPATH="$srcdir/.go"

	cd "$srcdir/$pkgname-$pkgver/"
	go get -u github.com/getantibody/antibody/cmd
	go build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

