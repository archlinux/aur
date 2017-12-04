# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.2.0
pkgrel=2
pkgdesc=""
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus' 'libevent' 'curl' 'json-c' 'ragel' 'meson' 'ninja')
depends=('dbus' 'libevent' 'curl' 'json-c')
source=("https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('60fc262cb0ee04f035d0ea1d8352f535ed388112defa791075751178e199b587')
validpgpkeys=('A9A02AFEFF4B4D3CCC80F6168218F7122969D484')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/
	meson --buildtype=release build/
	ninja -C build/
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"
	DESTDIR="$pkgdir" ninja -C build/ install
}

