# Maintainer: stickynotememo <samk26633@gmail.com>
pkgname=solcl
pkgver=0.1.2
pkgrel=1
pkgdesc="solar system visualization tui"
arch=(x86_64)
url="https://github.com/Cladamos/$pkgname"
license=('MIT')
depends=()
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('535a2e6461d3a211348ce927599eb86e4bd336929119f29c7e5ed4d4f7e573f2')

build() {
	cd "$pkgname-$pkgver"
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build "$pkgdir"/usr/bin/$pkgname
}
