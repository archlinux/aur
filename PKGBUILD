# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=piawgcli
pkgver=0.0.10
pkgrel=1
pkgdesc="A tool to quickly and easily create WireGuard configuration files for PIA"
arch=(x86_64)
url="https://gitlab.com/ddb_db/piawgcli"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=(
	"https://gitlab.com/ddb_db/piawgcli/-/archive/v$pkgver/piawgcli-v$pkgver.tar.bz2"
)
sha384sums=('479fb0ac1d04ed3c0fd4573495ed3f27eb0761b8c0756b2419cd273a30ca9667cadc19b06899f28668e0a796691c72db')

build() {
	cd "$pkgname-v$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	mkdir -p build
	go build -o build ./cmd/...
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 build/piawgcli "${pkgdir}/usr/bin/piawgcli"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
