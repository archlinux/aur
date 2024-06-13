# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=0.1.0
pkgrel=3
pkgdesc="A CLI program that prints random words generated from the EFF Large Wordlist."
arch=('x86_64')
url="https://github.com/wordgen/cli"
license=('AGPL-3.0-or-later')
makedepends=('go')
options=(!strip !debug)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('df7fbfe648c054e1156ab31cc2f226302d150f37b7b6dfab87b3ebca30471158')

build() {
	cd "$srcdir/cli-$pkgver"

	go build -o "bin/$pkgname" -trimpath -ldflags="-s -w -X main.version=v$pkgver -buildid=" .
}

package() {
	cd "$srcdir/cli-$pkgver"

	install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
