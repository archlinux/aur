# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.2.52
pkgrel=3
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus' 'libevent' 'curl' 'json-c' 'ragel' 'meson' 'ninja')
depends=('dbus' 'libevent' 'curl' 'json-c')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6ebc78ed300ca41cfb014fd9c1a92babc4b63f1e8d712275891d79154a39315a')
validpgpkeys=('A9A02AFEFF4B4D3CCC80F6168218F7122969D484')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/
	meson --buildtype=release -Dversion=${pkgver}-${pkgrel} --unity on build/
	ninja -C build/
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"
	DESTDIR="$pkgdir" ninja -C build/ install
}

