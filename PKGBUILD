# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=timetrack
pkgver=2.0.8
pkgrel=1
pkgdesc="Simple time-tracking app for GNOME"
arch=('any')
url="https://gitlab.gnome.org/danigm/timetrack"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-timeago')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/danigm/timetrack/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c6f3387a5ad27539a8edca8576ccda3d4df56b3663d4817d9ed2ef6ab085070b')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
