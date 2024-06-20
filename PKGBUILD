# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=0.5.0
pkgrel=1
pkgdesc='A CLI random word generator.'
arch=('x86_64')
url='https://github.com/wordgen/cli'
license=('AGPL-3.0-or-later')
makedepends=('go')
options=('!strip' '!debug')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6854b1e82023f8111b2940610f558b6c48ac769fefd8e4f7c88210e2e1f326a7')

build() {
	cd "$srcdir/cli-$pkgver"

	go build -o "bin/wordgen" -trimpath -ldflags="-s -w -buildid=" .
}

package() {
	cd "$srcdir/cli-$pkgver"

	install -Dm755 "bin/wordgen" "$pkgdir/usr/bin/wordgen"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/wordgen/LICENSE"
}
