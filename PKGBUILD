# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=tt
pkgver=0.4.2
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f2b5d6f0795986532f072980e46e6e47d212c508dda51a1338a0d7fd094a73e8f1fa778b8c78795cee3ff7364c6925b1e8fb7e0443928edd493f88506a5732e9')

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

	make DESTDIR="$pkgdir" PREFIX='/usr' install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
