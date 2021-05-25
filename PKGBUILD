# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2
pkgver=1.6.4
pkgrel=2
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
b2sums=('d75766166b73e6107b3ffd456f55054fe2cca6ab2e7c6f710725f574df8203920c2f30ae4ee718954e628ed282f6a0b2ade8b06130fd4f981b9e0413731aea1a')

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
