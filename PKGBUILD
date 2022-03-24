# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=timetrack
pkgver=2.0.4
pkgrel=1
pkgdesc="Simple time-tracking app for GNOME"
arch=('any')
url="https://gitlab.gnome.org/danigm/timetrack"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-gobject' 'python-timeago')
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/danigm/timetrack/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e7c5f8db9ba69037c591754396ce3b1e87ed33d432cf3155fe7cc96e273d2abc')

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
