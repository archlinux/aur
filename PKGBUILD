# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=meteo
pkgver=1.0.0
pkgrel=1
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('x86_64')
url="https://gitlab.com/bitseater/meteo"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libayatana-appindicator'
  'libadwaita'
  'libgee'
  'libsoup3'
  'webkitgtk-6.0'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
conflicts=('meteo-gtk')
source=("git+https://gitlab.com/bitseater/meteo.git#tag=$pkgver")
sha256sums=('69fbb58ac05a443ba71401424a61a1568b9c7de43c89410593a714dc6d053915')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/com.gitlab.bitseater.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
