# Maintainer: Damian Miller <rysas@mail.naimad.dev>
pkgname=lumoria
pkgver=0.2.0
pkgrel=1
pkgdesc="A Linux installer and launcher for Final Fantasy XI"
arch=('x86_64')
url="https://github.com/Windower/Lumoria"
license=('GPL-3.0-or-later')
conflicts=('lumoria-bin')
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
  'rust'
)
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14d6cb68d8bfa2bfb398a0cb61cb99a558bcdf18663a6af579d2d31ac74d76e3')

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
