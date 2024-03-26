# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=0.10.8
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugin-gtk'
  'gst-plugins-good'
  'gst-python'
  'gtk3'
  'libhandy'
  'libndp'
  'libnm'
  'libpwquality'
  'librsvg'
  'polkit'
  'python-gobject'
  'python-kiss-headers'
  'python-logbook'
  'python-pillow'
  'python-requests'
  'python-single-version'
  'zbar'
)
makedepends=('gobject-introspection' 'meson')
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d97d58a8ab5350f1c911e803956161e78290759f58be92b0116da4296ef0b77f')

build() {
  arch-meson "CoBang-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
