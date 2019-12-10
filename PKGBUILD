# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=meteo-gtk
pkgver=0.9.8
pkgrel=2
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('any')
url="https://gitlab.com/bitseater/meteo"
license=('GPL3')
depends=('gtk3' 'geocode-glib' 'webkit2gtk' 'libappindicator-gtk3')
makedepends=('meson' 'vala' 'appstream-glib')
optdepends=('gnome-shell-extension-appindicator')
provides=("${pkgname%-gtk}")
conflicts=("${pkgname%-gtk}")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/${pkgname%-gtk}-$pkgver.tar.gz")
sha256sums=('22d8132e9c3bc62b3ec090275abd8b211d9d99b89812dc69e987cd315f898d0d')

build() {
	cd "${pkgname%-gtk}-$pkgver"
	arch-meson . build
	ninja -C build
}

package() {
	cd "${pkgname%-gtk}-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	ln -s /usr/bin/com.gitlab.bitseater.meteo "$pkgdir/usr/bin/${pkgname%-gtk}"
}
