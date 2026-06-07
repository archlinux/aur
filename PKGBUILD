# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <dkiziridis at outlook dot com>
pkgname=blackbox-terminal
pkgver=0.15.1
pkgrel=1
pkgdesc="A beautiful GTK 4 terminal"
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/blackbox"
license=('GPL-3.0-or-later')
depends=(
  'graphene'
  'json-glib'
  'libadwaita'
  'libgee'
  'librsvg'
  'libxml2'
  'pcre2'
  'vte4'
)
makedepends=(
  'meson'
  'vala'
)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/blackbox-v$pkgver.tar.gz")
sha256sums=('14346fced7fef73239c53d4fbe02e8bfcd685370708bad69960f994f438b252e')

prepare() {
  cd "blackbox-v$pkgver"

}

build() {
  arch-meson "blackbox-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
