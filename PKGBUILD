# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adwsteamgtk
pkgver=0.6.6
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
sha256sums=('ac035e65d0f1181fd2f61755ea346d2ae1c0acd9886b67fdd4687a80e83a9218')

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
