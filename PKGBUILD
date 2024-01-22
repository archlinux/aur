# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=timetrack
pkgver=2.2.0
pkgrel=1
pkgdesc="Simple time-tracking app for GNOME"
arch=('any')
url="https://gitlab.gnome.org/danigm/timetrack"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-timeago')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/danigm/timetrack/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('47e00b49c80393e4df3f889bfbb1a9e68997b94a721f630a09b121d7906bbd42')

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
