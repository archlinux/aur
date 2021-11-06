# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=piawgcli
pkgver=0.0.8
pkgrel=1
pkgdesc="A tool to quickly and easily create WireGuard configuration files for PIA"
arch=(x86_64)
url="https://gitlab.com/ddb_db/piawgcli"
license=('GPL3')
makedepends=('go')
source=(
	"https://gitlab.com/ddb_db/piawgcli/-/archive/v$pkgver/piawgcli-v$pkgver.tar.bz2"
)
sha384sums=('6d939de5b32c9616afa4f126ecdf8bbc18bb899508842e75216f3817add9b1d06f8ad35074416c6a219f6f06796ea51e')

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
