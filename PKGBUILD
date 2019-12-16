# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='orbterm'
pkgver='0.3.6'
pkgrel='2'
pkgdesc='The default terminal for RedoxOS, compatible with Linux'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.redox-os.org/redox-os/$pkgname"
license=('MIT')
depends=('sdl2')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c2962e9fca39f3ce51f5dafe4077112cc4ee292f19aa978cac89e6320c36be8c')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory"
	cargo build --release --locked
}

package() {
	cd "$srcdir/$_sourcedirectory"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
