# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=godef
pkgver=1.2.0
pkgrel=1
pkgdesc='Print where symbols are defined in Go source code.'
arch=('x86_64')
url="https://github.com/rogpeppe/godef"
license=('BSD-3-Clause')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('38cdb91bcec60e38fb4b463e961608a88bc083796fe97230d68d8bc91a12fc79')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o "$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README' -t "$pkgdir/usr/share/doc/$pkgname"
}
