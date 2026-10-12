# Maintainer: Cavernosa <cvrns at proton dot me>
pkgname=akrasia
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI task manager inspired by Greek philosophy on self-control"
arch=('any')
url="https://github.com/luis-octavius/akrasia"
license=('MIT')
depends=('sqlite')
makedepends=('git' 'go')
checkdepends=()
source=("git+$url.git#tag=v.$pkgver")
sha256sums=('9c93841eefe7ff0fa3c62f66abdf8f99365d6e93d3975c05bc1b6da4f9eed625')
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
