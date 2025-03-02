# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=1.4.0
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
source=("CoBang-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e13b51c5d92744f546de14b27c6c56f46d86c9c6c04ee3d5b6d79ec2ca35589c')

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
