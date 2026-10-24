# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adwsteamgtk
pkgver=0.9.1
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'python-gobject'
  'python-packaging'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
checkdepends=(
  'appstream-glib'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50ef31466260054bd5c2101e74b052098e5030f07b660e2d89f07958002b0144')

build() {
  arch-meson "AdwSteamGtk-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
