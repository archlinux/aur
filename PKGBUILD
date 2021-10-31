# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=sqls
pkgver=0.2.20
pkgrel=1
pkgdesc="Implementation of the Language Server Protocol for SQL"
arch=('x86_64')
url="https://github.com/lighttiger2505/sqls"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('mysql' 'sqlite3' 'postgresql')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ab9a7cfc4cd881df88efd388fa2b27e7807b0580c0d9b21165946cc452905cdb')

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
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D sqls -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
