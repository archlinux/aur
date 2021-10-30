# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=meteo-gtk
pkgver=0.9.9
pkgrel=1
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('x86_64')
url="https://gitlab.com/bitseater/meteo"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'webkit2gtk')
makedepends=('meson' 'vala')
checkdepends=('appstream')
provides=("${pkgname%-gtk}")
conflicts=("${pkgname%-gtk}")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/${pkgname%-gtk}-$pkgver.tar.gz")
sha256sums=('dea9dd25da3d792d0713a3761b5c43ca8dad54a4eb17a8d688212a9acfafd855')

build() {
  arch-meson "${pkgname%-gtk}-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/com.gitlab.bitseater.meteo "$pkgdir/usr/bin/${pkgname%-gtk}"
}
