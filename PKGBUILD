# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=0.10.3
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
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
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d0507d5a60705e21f9e5065a771329ec78ac522a7f0cb3f32dfb5ec2a5cacf1')

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
