# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2
pkgver=1.6.3
pkgrel=1
pkgdesc="Cross-platform command-line tool for batch renaming files and directories quickly and safely"
arch=(x86_64 i686 aarch64)
url="https://github.com/ayoisaiah/$pkgname"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'go'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c22ada2fc51a444e0f9454f647555dcc99b60ee5aeeb018a1ede7cad064516f5f14e52a66b618768da272bb626fbd9152a3385dc5fed4e2b977d5d5fea0a72ca')

build() {
	export local CGO_CPPFLAGS="${CPPFLAGS}"
	export local CGO_CFLAGS="${CFLAGS}"
	export local CGO_CXXFLAGS="${CXXFLAGS}"
	export local CGO_LDFLAGS="${LDFLAGS}"
	export local GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o f2 ./cmd/f2
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
