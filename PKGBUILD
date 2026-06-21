# Maintainer: Damian Miller <rysas@mail.naimad.dev>
pkgname=lumoria
pkgver=0.1.19
pkgrel=1
pkgdesc="A Linux installer and launcher for Final Fantasy XI"
arch=('x86_64')
url="https://github.com/Windower/Lumoria"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libarchive'
  'libgee'
  'libgit2-glib'
  'libmspack'
  'libsoup3'
  'libmanette'
  'libportal'
  'libportal-gtk4'
  'vte4'
  'libxml2'
)
makedepends=(
  'cmake'
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af214e86d6ac81a6804a0972a889cd2ec910d2d8e5c1ed2e60ecf0681871eed8')

build() {
  arch-meson "Lumoria-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
