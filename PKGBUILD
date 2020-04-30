# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.3.5
pkgrel=2
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus' 'libevent' 'curl' 'json-c' 'meson' 'ninja' 'scdoc')
depends=('dbus' 'libevent' 'curl' 'json-c')
optdepends=('scdoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mariusor/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('84fa9bef4f7b2c23b2a2d7c7046ee246c710f81c2e7513774ba2e86a323b67a6')
validpgpkeys=('57D7D1ACC58E01C56961F9FB0FBA983067613EE6')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/
	meson --buildtype=release --debug=false -Dversion=${pkgver}-${pkgrel} --prefix=/usr --unity on build/
	ninja -C build/
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"
	DESTDIR="$pkgdir" ninja -C build/ install
}
