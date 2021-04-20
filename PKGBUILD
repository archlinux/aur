# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=tt
# To match default theme with v4.0.0 binary release
_gitcommit=57357e2674e30912c6ebae7c0b5009d770ff50e0
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal based typing test"
arch=('any')
url="https://github.com/lemnos/tt"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'go'
)
source=("$pkgname-$pkgver::git+$url/#commit=$_gitcommit")
b2sums=('SKIP')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$srcdir/$pkgname-$pkgver"
	make all
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 bin/tt -t "$pkgdir/usr/bin"
	install -Dm644 tt.1.gz -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
