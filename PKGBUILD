# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=sqls
pkgver=0.2.18
pkgrel=1
pkgdesc="Implementation of the Language Server Protocol for SQL"
arch=('x86_64')
url="https://github.com/lighttiger2505/sqls"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('mysql' 'sqlite3' 'postgresql')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f78f3c21fc03995731d5c035edff5f6c508864b3280d8d1e9665f27d1cc973dc')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build .
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dvm 755 sqls -t "$pkgdir/usr/bin/"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
