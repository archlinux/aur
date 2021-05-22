# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2
pkgver=1.6.4
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
b2sums=('64eee06023557934f2a1216576a52a2fb547f3e161e7a39692ae1d43e242468eb413def0ec69c34d529a0cd1ae682b027a0baba1fefff8c5c3294deb94028408')

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
