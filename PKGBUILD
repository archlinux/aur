# Maintainer: Hailey <me@haileyok.com>
pkgname=goat-cli
pkgver=0.1.2
pkgrel=1
pkgdesc="Go AT protocol CLI tool"
arch=('x86_64')
url="https://github.com/bluesky-social/goat"
license=('MIT')
depends=()
makedepends=('go')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bluesky-social/goat/archive/v$pkgver.tar.gz")
sha256sums=('3a341fe0cee62cf4dd025db9fb220d06c954f70250812a14bb51a7ba3380f9a4')

build() {
	cd "goat-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make build
}

package() {
	cd "goat-$pkgver"
	install -Dm755 goat "$pkgdir/usr/bin/goat"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
