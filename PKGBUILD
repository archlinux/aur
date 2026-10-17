# Maintainer: Cavernosa <cvrns at proton dot me>
pkgname=akrasia
pkgver=1.1.1
pkgrel=1
pkgdesc="CLI task manager inspired by Greek philosophy on self-control"
arch=('any')
url="https://github.com/luis-octavius/akrasia"
license=('MIT')
depends=('sqlite')
makedepends=('git' 'go')
checkdepends=()
source=("git+$url.git#tag=v.$pkgver")
sha256sums=('2b1dc95188de8b7d1b692136cf6b1c6b92ae7d20241bb26345419bff3aa027fe')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	mkdir -p build/
	export GOPATH="${srcdir}"
	go mod download -modcacherw 
}

build() {
	cd "$pkgname"
	export GOFLAGS="-trimpath"
	go build -o akrasia .
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
