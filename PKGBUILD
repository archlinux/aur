# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=bbolt
pkgver=1.3.11
pkgrel=1
pkgdesc="An embedded key/value database for Go"
arch=(x86_64)
url="https://github.com/etcd-io/bbolt"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f562211dfdbcc91ff6cf9c4b6be5707563cb3731c3e6bec9be2eeb91f680fb321e074820f024978aecc1a52e1e66f495f727811f533941fe15ae881c33ea89cf')

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
