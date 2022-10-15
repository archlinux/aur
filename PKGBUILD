# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=adwsteamgtk
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL3')
depends=('cantarell-fonts' 'libadwaita' 'python-gobject' 'python-packaging')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
optdepends=('steam: system Steam package; Flatpak can also be used')
optdepends=('gnome-shell-extension-rounded-window-corners: Rounded corners on GNOME')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eacdca7e1adb05a1758859deaac5214754e2194a41ce4f3473121340db219cea')

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
