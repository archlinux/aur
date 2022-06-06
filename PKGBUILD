# Maintainer: Federico Serra <fedeztk at tutanota dot com>

pkgname=sku-git
_name=sku
pkgver=r5.a81afe3
pkgrel=1
pkgdesc="Simple TUI sudoku written in go"
arch=('any')
url="https://github.com/fedeztk/sku"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('sku')
conflicts=('sku')
source=('git+https://github.com/fedeztk/sku.git')
sha256sums=('SKIP')

build() {
	cd "$_name"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o sku ./cmd/sku/main.go
}

package() {
	cd "$_name"
	install -Dm755 sku "$pkgdir/usr/bin/sku"
	install -Dm644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
