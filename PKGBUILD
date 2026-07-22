# Maintainer: shikatagana1 <lukaturkadze34@gmail.com>
pkgname=jeka
pkgver=0.1.0
pkgrel=1
pkgdesc="Reverse-DNS lookup CLI: current PTR + passive-DNS history for an IP or a file of IPs"
arch=('x86_64' 'aarch64')
url="https://github.com/shikatagana1/jeka"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f881b4a9e3b99c189b24525faaebfd9a5e8af027091500f449b1f3a8acaac663')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
