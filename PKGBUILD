# Maintainer: Marius Orcsik <marius@littr.me>
pkgname=mpris-scrobbler
pkgver=0.5.4
pkgrel=1
pkgdesc="Minimalistic user daemon which submits the currently playing song to libre.fm and compatible services."
arch=('x86' 'x86_64')
url="https://github.com/mariusor/mpris-scrobbler"
license=('MIT')
makedepends=('dbus>=1.9' 'libevent' 'curl' 'json-c' 'meson' 'ninja' 'scdoc')
depends=('dbus>=1.9' 'libevent' 'curl' 'json-c')
optdepends=('xdg-utils' 'scdoc')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~mariusor/${pkgname}/archive/v${pkgver}.tar.gz")
validpgpkeys=('57D7D1ACC58E01C56961F9FB0FBA983067613EE6')
sha256sums=('c16319d841b92dd95fc3e40189fe6c679445aa45bc63bfa615a3afa58fcf5876')

build() {
	cd "${pkgname}-v${pkgver}"
	rm -rf build/
	meson setup -Dbuildtype=release -Db_pie=true -Db_ndebug=if-release -Dversion=${pkgver}-${pkgrel} --prefix=/usr --unity on build/
	ninja -C build/
}

package() {
	cd "${pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}"
	DESTDIR="${pkgdir}" ninja -C build/ install
}
