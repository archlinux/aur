# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=cassette
pkgver=0.2.4
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
sha512sums=('43bb332150583d4369be7849d4e4980d78573846265cdc91aaeadcb46cfe32170dbfc8b317c12993ea9a589a8369e5db2e561b732470929f6faa7f7d22b31094')

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
