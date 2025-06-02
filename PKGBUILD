# Maintainer: elbachir-one <bachiralfa@gmail.com>
pkgname=tint
pkgver=0.1.4
pkgrel=1
pkgdesc="Recolor images using your favorite theme palettes"
arch=('x86_64')
url="https://github.com/ashish0kumar/tint"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ashish0kumar/tint/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0092716affb820b1809951e0ee5a20bb1c2584c82f68860d19e758afa7b5bf1d')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"
	go build -v -o tint
}

# Optional check() block if upstream supports testing
# check() {
#     cd "$srcdir/$pkgname-$pkgver"
#     go test ./...
# }

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 tint "$pkgdir/usr/bin/tint"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
