# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=meteo-gtk
pkgver=0.9.8
pkgrel=3
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('any')
url="https://gitlab.com/bitseater/meteo"
license=('GPL3')
depends=('gtk3' 'geocode-glib' 'webkit2gtk')
makedepends=('meson' 'vala')
optdepends=('libappindicator-gtk3: for tray icon')
checkdepends=('appstream')
provides=("${pkgname%-gtk}")
conflicts=("${pkgname%-gtk}")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/${pkgname%-gtk}-$pkgver.tar.gz")
sha256sums=('22d8132e9c3bc62b3ec090275abd8b211d9d99b89812dc69e987cd315f898d0d')

build() {
	arch-meson "${pkgname%-gtk}-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	ln -s /usr/bin/com.gitlab.bitseater.meteo "$pkgdir/usr/bin/${pkgname%-gtk}"
}
