
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=godef
pkgver=1.1.2
pkgrel=2
pkgdesc='Print where symbols are defined in Go source code.'
arch=('x86_64')
url="https://github.com/rogpeppe/$pkgname"
license=('BSD')
makedepends=('go')
conflicts=('godef-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('48a1680e9a7db28f19c4b5716402c615bbab454c769c28d9e373df75bde48b9c')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -v -o "$pkgname"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README' -t "$pkgdir/usr/share/doc/$pkgname"
}
