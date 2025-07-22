# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=timetrack
pkgver=2.2.1
pkgrel=1
pkgdesc="Simple time-tracking app for GNOME"
arch=('any')
url="https://gitlab.gnome.org/danigm/timetrack"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
  'python-timeago'
)
makedepends=(
  'gobject-introspection'
  'meson'
)
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/danigm/timetrack/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c156c2f81a3d797cfb605757080376a4132571100f721e5432808d0a83c482b6')

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
