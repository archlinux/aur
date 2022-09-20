# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=adwsteamgtk
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL3')
depends=('cantarell-fonts' 'libadwaita' 'python-gobject' 'python-packaging' 'steam')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=('gnome-shell-extension-rounded-window-corners: Rounded corners on GNOME')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6c8e75c6caf2652f4bf010ca6aec823f8a7bfe2b74aabce8aec2ba54cf26d4d')

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
