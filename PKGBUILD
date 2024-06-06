# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=0.13.0
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
sha256sums=('62a3706862a7eeaaa7ee838f449137bed49258d5e32eabc0df980dfc000dd86c')

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
