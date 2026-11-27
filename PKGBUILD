# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=2.13.0
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugin-gtk4'
  'gst-plugins-good'
  'gst-python'
  'gstreamer'
  'gtk4'
  'libadwaita'
  'libndp'
  'libnm'
  'libportal'
  'libportal-gtk4'
  'libpwquality'
  'polkit'
  'python-gobject'
  'python-logbook'
  'python-pillow'
  'python-qrcode'
  'zbar'
)
makedepends=(
  'blueprint-compiler'
  'gobject-introspection'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("CoBang-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50f4aff3a9a0a2ae0ec75e69dfc4cdc8fd93efcdd4ad1400ac274f9574da01f7')

build() {
  arch-meson "CoBang-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
