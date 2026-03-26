# Maintainer: James Willson <jsdoublel@gmail.com>
pkgname=camus
pkgver=1.0.1
pkgrel=1
pkgdesc="A scalable program for inferring level-1 phylogenetic networks"
arch=('x86_64' 'aarch64')
url="https://github.com/jsdoublel/camus"
license=('MIT')
depends=()
makedepends=('go>=1.24')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('73a3c032a1f4f14c9cf555b0d5d19aae2e7006607e502a94c5fd15a3859b6d45')

prepare() {
	cd "$pkgname-$pkgver"
	GOPATH="$srcdir/gopath" GOFLAGS="-modcacherw" go mod download
}

build() {
	cd "$pkgname-$pkgver"
	GOPATH="$srcdir/gopath" CGO_ENABLED=0 GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw" \
		go build -o "$pkgname" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
