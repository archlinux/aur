# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=bbolt
pkgver=1.3.8
pkgrel=1
pkgdesc="An embedded key/value database for Go"
arch=(x86_64)
url="https://github.com/etcd-io/bbolt"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b2d51e9f40a44ca5eaaf36d7c635b911f5f45aacc637b2ca4f6d1b6d3b673f7cafc2cfc60b64b0eb41056ee07298dbc8aa8d5b19cd343a3acf1d95ba5cf15ab2')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o $pkgname ./cmd/bbolt
}

check() {
	cd "$pkgname-$pkgver"
	make -k test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
