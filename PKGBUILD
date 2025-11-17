# Maintainer: Dmitry Mozzherin <dmozzherin@gmail.com>

pkgname=pomati
pkgver=0.3.1
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
sha256sums=('79018f762e8eb93cd371e3a95b48060edd1faa9df3d7cc9e6e1709773e003891')
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
}
