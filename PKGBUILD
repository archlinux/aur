# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=1.1.0
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugin-gtk'
  'gst-plugins-good'
  'gst-python'
  'gtk4'
  'libadwaita'
  'libndp'
  'libnm'
  'libportal-gtk4'
  'libpwquality'
  'polkit'
  'python-logbook'
  'python-pillow'
  'zbar'
)
makedepends=(
  'blueprint-compiler'
  'gobject-introspection'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85ffa586bb7f1ade1c84057d82238a0bd795cb4beae112bd63ee9741c22d2714')

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
