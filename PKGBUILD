# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dimitris Kiziridis <dkiziridis at outlook dot com>
pkgname=blackbox-terminal
pkgver=0.15.2
pkgrel=1
pkgdesc="A beautiful terminal for GNOME"
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
optdepends=('nautilus-python: Nautilus extension')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/blackbox-v$pkgver.tar.gz")
sha256sums=('219f77be88859fb069d667e5bd4a664d1c0ee3ddd68f94872f2c9d28fc521183')

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
