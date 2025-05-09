# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.5.7
pkgrel=1
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://git.sr.ht/~mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus>=1.9' 'libevent' 'curl' 'json-c' 'meson' 'ninja' 'scdoc')
depends=('dbus>=1.9' 'libevent' 'curl' 'json-c')
optdepends=('xdg-utils')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~mariusor/${pkgname}/archive/v${pkgver}-rc1.tar.gz")
validpgpkeys=('57D7D1ACC58E01C56961F9FB0FBA983067613EE6')
sha256sums=('972296f467673d0aac3f98b8da0e14062759ce229fb1db2f913119e4d67c090f')

build() {
	cd "${pkgname}-v${pkgver}-rc1"
	rm -rf build/
	meson setup -Dbuildtype=release -Db_pie=true -Db_ndebug=if-release -Dversion=${pkgver}-${pkgrel} --prefix=/usr --unity on build/
	ninja -C build/
}

package() {
	cd "${pkgname}-v${pkgver}-rc1"
	mkdir -p "${pkgdir}"
	DESTDIR="${pkgdir}" ninja -C build/ install
}
