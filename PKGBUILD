# Maintainer: Damian Miller <rysas@mail.naimad.dev>
pkgname=lumoria
pkgver=0.1.2
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
  'libmspack'
  'libsoup3'
  'libmanette'
  'vte4'
)
makedepends=(
  'meson'
  'vala'
)
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74e8433b3285f91bee161c78b5ff5266c5a7284da59d3e0f1fe244601e251a35')

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
