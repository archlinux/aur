# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adwsteamgtk
pkgver=0.6.11
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'libportal-gtk4' 'python-gobject' 'python-packaging')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
conflicts=('adwaita-for-steam')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34d31e9c13c5afd496e72fb07bdf6a7cd1538658896067c95cc4f611ebe901e6')

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
