# Maintainer: Cavernosa <cvrns at proton dot me>
pkgname=akrasia
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI task manager inspired by Greek philosophy on self-control"
arch=('any')
url="https://github.com/luis-octavius/akrasia"
license=('MIT')
depends=('sqlite')
makedepends=('git' 'go')
checkdepends=()
source=("git+$url.git#tag=v$pkgver")
sha256sums=('42c1347719d74dbacd0b81f7436a7b3a13ffab840c06ee0f142272b79bacb4fc')
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
