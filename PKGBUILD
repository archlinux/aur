# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=meteo-gtk
pkgver=0.9.6
pkgrel=1
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('any')
url="https://gitlab.com/bitseater/meteo"
license=('GPL3')
depends=('gtk3' 'libsoup' 'json-glib' 'geocode-glib' 'webkit2gtk' 'libappindicator-gtk3')
makedepends=('meson' 'vala' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/bitseater/meteo/-/archive/$pkgver/meteo-$pkgver.tar.gz")
sha256sums=('6ab3edea22a8835d8d6ea920944857400c2b3e49c74c35007d6ed1cbf38d5b83')

build() {
	cd "meteo-$pkgver"
	meson . build --prefix /usr
	ninja -C build
}

package() {
	cd "meteo-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	ln -s $pkgdir/usr/bin/com.gitlab.bitseater.meteo $pkgdir/usr/bin/meteo
}
