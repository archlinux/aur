# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.3.4
pkgrel=1
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus' 'libevent' 'curl' 'json-c' 'meson' 'ninja' 'scdoc')
depends=('dbus' 'libevent' 'curl' 'json-c')
optdepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('583f319337c3323f6cb43eea00398a1d8f1d4bfbf14d17579d2e2922f2009b37')
validpgpkeys=('57D7D1ACC58E01C56961F9FB0FBA983067613EE6')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/
	meson --buildtype=debug -Dversion=${pkgver}-${pkgrel} --prefix=/usr --unity on build/
	ninja -C build/
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"
	DESTDIR="$pkgdir" ninja -C build/ install
}
