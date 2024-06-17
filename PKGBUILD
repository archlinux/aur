# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=0.4.0
pkgrel=1
pkgdesc='A CLI program that prints random words.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
makedepends=('go')
options=('!strip' '!debug')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8f4d8067a5e45da72a7cfbe9bdb8dafb1a3910ef539dd665c0e3c31b511f1837')

build() {
	cd "$srcdir/cli-$pkgver"

	go build -o "bin/wordgen" -trimpath -ldflags="-s -w -X main.version=v$pkgver -buildid=" .
}

package() {
	cd "$srcdir/cli-$pkgver"

	install -Dm755 "bin/wordgen" "$pkgdir/usr/bin/wordgen"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wordgen/LICENSE"
}
