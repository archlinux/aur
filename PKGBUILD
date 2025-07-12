# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=bbolt
pkgver=1.4.2
pkgrel=1
pkgdesc="An embedded key/value database for Go"
arch=(x86_64)
url="https://github.com/etcd-io/bbolt"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('1582cbfaf44987822616b986a5bd8b50a40ab33d52c0decc827f4013efaf06608bbbaf9e3c73804fff7b4b00e798d5399f417f14cf4804f63abcab9459f31540')

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
