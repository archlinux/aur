# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=pomati
pkgver=0.3.4
pkgrel=1
pkgdesc='Frictionless Pomodoro timer for tiling window managers.'
arch=('x86_64' 'aarch')
url="https://codeberg.org/dimus/$pkgname"
license=('MIT')
makedepends=(
	'go'
	'just'
)
depends=(
)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://codeberg.org/dimus/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c0099eed3547fa4c59f800cf81244aa7670923bb3f278ad5cc6d059d28965d19')
options=('!debug')

prepare() {
	cd "$pkgname"
	mkdir -p build/
}

build() {
	cd "$pkgname"
	just build-release
}

check() {
	cd "$pkgname"
	just test
}

package() {
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 "$srcdir/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/$pkgname/scripts/pompull" "$pkgdir/usr/bin/pompull"
	install -Dm755 "$srcdir/$pkgname/scripts/pompush" "$pkgdir/usr/bin/pompush"
}
