# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=timetrack
pkgver=2.0.3
pkgrel=1
pkgdesc="Simple time-tracking app for GNOME"
arch=('any')
url="https://gitlab.gnome.org/danigm/timetrack"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-timeago')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/danigm/timetrack/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7e542822421a384fc6453a9ae211ac5b1f492c82b193a5a04b90aea7bdea138b')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s/  'desktop',/#  'desktop',/g" data/meson.build
  sed -i "s/  'appdata',/#  'appdata',/g" data/meson.build
}

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
