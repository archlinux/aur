# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2
pkgver=1.7.2
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/$pkgname"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'go'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('72cf26d307e8a9f062a2a7d74884ee4a50b0143715e9b6aea4e31f84fff8c4ae9c962947f2cf4518f4e35f63f1b8d2de03481a91c763738012e7cac5c9f16c9f')

build() {
	export local CGO_CPPFLAGS="${CPPFLAGS}"
	export local CGO_CFLAGS="${CFLAGS}"
	export local CGO_CXXFLAGS="${CXXFLAGS}"
	export local CGO_LDFLAGS="${LDFLAGS}"
	export local GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	make build
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
