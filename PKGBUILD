# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette
pkgver=0.2.5
pkgrel=1
pkgdesc="GTK4/Adwaita application that allows you to use Yandex Music service on Linux operating systems"
arch=(aarch64 i686 x86_64)
url="https://altlinux.space/rirusha/${pkgname^}"
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glibc
  glib2
  gst-plugins-good
  gstreamer
  gtk4
  json-glib
  hicolor-icon-theme
  libadwaita
  libsoup3
  libgee
  libxml2
  sqlite
  webkitgtk-6.0
  xdg-desktop-portal-impl
)
makedepends=(
  blueprint-compiler
  meson
  vala
)
options=(!debug)
source=("$pkgname-$pkgver.tar.zst::$url/releases/download/v$pkgver/${pkgname^}-$pkgver.tar.zst")
sha512sums=('a09e0298e61721ed247f519483789143d78b917bbad69b4ba1545197c27971278514f1595840186b119e220c05528dcd0335db795ab5b60b396cf6a2abae73d7')

build() {
  cd "${pkgname^}-$pkgver"
  arch-meson build
  meson configure  build --no-pager
  meson compile -C build
}

package() {
  cd "${pkgname^}-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
