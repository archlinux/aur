# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adwsteamgtk
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL3')
depends=('libadwaita' 'libportal' 'python-gobject' 'python-packaging')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
conflicts=('adwaita-for-steam')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bddef992c2dfc5b573b835139481dd470f19b9a56324d45eb7d6ede23616cfe8')

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
