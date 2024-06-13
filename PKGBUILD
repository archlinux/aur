# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=1.0.0
pkgrel=2
pkgdesc="A CLI program that prints random words generated from the EFF Large Wordlist."
arch=('x86_64')
url="https://github.com/danny-kuehn/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=('go')
options=(!debug)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('aad62444915782d609c44e0c1bf6cfdf13638ca285a39ad888314f50770f43ed')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	go build -o "bin/$pkgname" -trimpath -ldflags="-s -w -X main.version=$pkgver -buildid=" ./cmd/wordgen
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
