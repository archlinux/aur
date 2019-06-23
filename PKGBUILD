# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=meteo-gtk
pkgver=0.9.7
pkgrel=4
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('any')
url="https://gitlab.com/bitseater/meteo"
license=('GPL3')
depends=('gtk3' 'libsoup' 'json-glib' 'geocode-glib' 'webkit2gtk' 'libappindicator-gtk3')
makedepends=('meson' 'vala' 'appstream-glib')
provides=('meteo')
conflicts=('meteo')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bitseater/meteo/-/archive/$pkgver/meteo-$pkgver.tar.gz")
sha256sums=('47594d2243691d0afe9b88118fe951c957f5787f2bf9db5ce27d35bed26691f9')

build() {
	cd "meteo-$pkgver"
	meson . build --prefix /usr
	ninja -C build
}

package() {
	cd "meteo-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	ln -s /usr/bin/com.gitlab.bitseater.meteo $pkgdir/usr/bin/meteo
}
