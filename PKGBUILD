# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=receiver
_app_id=io.github.meehow.Receiver
pkgver=0.3.9
pkgrel=1
pkgdesc="Discover 30,000+ verified radio stations from around the world"
arch=('x86_64')
url="https://github.com/meehow/receiver"
license=('GPL-3.0-or-later')
depends=(
  'glib-networking'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gstreamer'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libsoup3'
  'sqlite'
  'webkitgtk-6.0'
  'webp-pixbuf-loader'
)
makedepends=(
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8be507195a3f9794c6ccc1fb29a6055c76466a70317c787de4c17532db37b315')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "data/${_app_id}.metainfo.xml"
  desktop-file-validate "data/${_app_id}.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
