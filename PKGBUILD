# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=0.3.0
pkgrel=1
pkgdesc="A CLI program that prints random words generated from the EFF Large Wordlist."
arch=('x86_64')
url="https://github.com/wordgen/cli"
license=('AGPL-3.0-or-later')
makedepends=('go')
options=(!strip !debug)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c6161382598aac235b912ca3a018d0862878665a06d1a383d128cd032e65133b')

build() {
	cd "$srcdir/cli-$pkgver"

	go build -o "bin/$pkgname" -trimpath -ldflags="-s -w -X main.version=v$pkgver -buildid=" .
}

package() {
	cd "$srcdir/cli-$pkgver"

	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
