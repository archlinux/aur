# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonplus
pkgver=0.6.6
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
sha256sums=('55871a36c18dc783ad3273d281be897e24db55268747104ee21697a871d0cebd')

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
