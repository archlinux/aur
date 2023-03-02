# Maintainer: Daniel Bodky <dbodky at gmail dot com>
pkgname=acorn-cli
pkgver="v0.6.0"
pkgrel=1
epoch=
pkgdesc="A simple application deployment framework for Kubernetes"
arch=('x86_64')
url="https://acorn.io/"
license=('Apache')
groups=()
depends=()
makedepends=('git' 'go')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("acorn-$pkgver::git+https://github.com/acorn-io/acorn#tag=$pkgver")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

build() {
	cd "acorn-$pkgver"
	export CGO_ENABLED=0 
	go build -o bin/acorn -ldflags "-s -w -X 'github.com/acorn-io/acorn/pkg/version.Tag=$pkgver'"
}

check() {
	cd "acorn-$pkgver"
	./bin/acorn -v
}

package() {
	cd "acorn-$pkgver"
	install -Dm755 bin/acorn "$pkgdir"/usr/bin/acorn
}
