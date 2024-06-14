# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=0.2.0
pkgrel=1
pkgdesc="A CLI program that prints random words generated from the EFF Large Wordlist."
arch=('x86_64')
url="https://github.com/wordgen/cli"
license=('AGPL-3.0-or-later')
makedepends=('go')
options=(!strip !debug)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('12c22e7d11332fd9c5cf2805f02aecf872e722a54f42a6402529764adecd8e99')

build() {
	cd "$srcdir/cli-$pkgver"

	go build -o "bin/$pkgname" -trimpath -ldflags="-s -w -X main.version=v$pkgver -buildid=" .
}

package() {
	cd "$srcdir/cli-$pkgver"

	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
