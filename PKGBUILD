# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adwsteamgtk
pkgver=0.7.1
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libportal-gtk4'
  'python-gobject'
  'python-packaging'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1fb2fdc238a0de63b2ac51256e6fab3b6af44b3ffefebc40cc56065b992bfbd')

build() {
  arch-meson "AdwSteamGtk-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
