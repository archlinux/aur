# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonplus
pkgver=0.6.4
pkgrel=1
pkgdesc="A modern compatibility tools manager"
arch=('x86_64' 'aarch64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libarchive'
  'libgee'
  'libnotify'
  'libsoup3'
  'sdl3'
)
makedepends=(
  'meson'
  'vala'
)
optdepends=(
  'gamemode'
  'gamescope'
  'mangohud'
  'protontricks'
  'scopebuddy'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46665282ea7ed65f3c1d7cc06afd0bb71be47b6b895105cd5e7c1af8a18370b1')

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
