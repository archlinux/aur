# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=tt
# To match default theme with v4.0.0 binary release
_gitcommit=57357e2674e30912c6ebae7c0b5009d770ff50e0
pkgver=0.4.0
pkgrel=3
pkgdesc="Terminal based typing test"
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64' )
url="https://github.com/lemnos/tt"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'go'
	'git'
)
source=("$pkgname-$pkgver::git+$url/#commit=$_gitcommit")
b2sums=('SKIP')

build() {
	export local CGO_CPPFLAGS="${CPPFLAGS}"
	export local CGO_CFLAGS="${CFLAGS}"
	export local CGO_CXXFLAGS="${CXXFLAGS}"
	export local CGO_LDFLAGS="${LDFLAGS}"
	export local GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	make all
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 bin/tt -t "$pkgdir/usr/bin"
	install -Dm644 tt.1.gz -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
