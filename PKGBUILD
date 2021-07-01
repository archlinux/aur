# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=plow
pkgver=1.1.0
pkgrel=1
pkgdesc="A high-performance HTTP benchmarking tool with real-time web UI & terminal displaying"
arch=('x86_64' 'aarch64')
url="https://github.com/six-ddc/plow"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa579bfa7fee552d84723b6f49d7851759bfd2ff15c9a5d0f216c11a838472a8')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 plow -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
