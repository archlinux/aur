# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adwsteamgtk
pkgver=0.6.8
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'python-gobject' 'python-packaging')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
conflicts=('adwaita-for-steam')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2db93fa0b2313fd0d030e3233aa5e9332f2ea4d84ec2e9630d6892d512e10102')

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
