# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carson Rueter <roachh@protonmail.com>

pkgname=gord
pkgver=2021_07_14
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Discord TUI client - Fork of cordless'
arch=('x86_64')
url="https://github.com/yellowsink/gord"
license=('BSD')
depends=('glibc')
makedepends=('go>=1.13')
replaces=('cordless')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('1c1fbbdc753e71fd9b5ccb7f0ba14483decbc0d313e319c1145a871373e3ae02')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$_pkgver"
	go build
}

check() {
	cd "$pkgname-$_pkgver"
	go test
}

package() {
	cd "$pkgname-$_pkgver"
	install -Dm 755 gord -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
