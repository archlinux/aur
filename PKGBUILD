# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=adwsteamgtk
pkgver=0.2.1
pkgrel=2
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL3')
depends=('libadwaita' 'python-gobject' 'python-packaging')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
conflicts=('adwaita-for-steam')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b7d50cbf339741715262a76675dbaa17adc5341555129510e9c1e0f393b21ce')

prepare() {
  cd "AdwSteamGtk-$pkgver"

  # Make Web Full Theme the Default
  # https://github.com/tkashkin/Adwaita-for-Steam/commit/9e4e6de1cf147a8500e1227b2f210853cd36b73f
  sed -i 's/("Base"), _("Full")/("Full"), _("Base")/g' src/window.blp
}

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
