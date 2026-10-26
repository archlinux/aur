# Maintainer: Cavernosa <cvrns at proton dot me>
pkgname=akrasia
pkgver=2.8.0
pkgrel=1
pkgdesc="CLI task manager inspired by Greek philosophy on self-control"
arch=('any')
url="https://github.com/luis-octavius/akrasia"
license=('MIT')
depends=()
makedepends=('git' 'go')
checkdepends=()
source=("git+$url.git#tag=v$pkgver")
sha256sums=('53884e40a60eee61f3864df53061993ace100b73de3f93fbb01a23aebb13b927')
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
	go test -race ./...
}

package() {
	cd "$pkgname"
	install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
