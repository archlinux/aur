# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonplus
pkgver=0.6.7
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
sha256sums=('ab1c5470f0a123d45da66c303ec319387a3c227b0b56bf0ccaf2e8eb632266ca')

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
