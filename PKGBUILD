# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=0.10.4
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
sha256sums=('7529a6bb97ca042cf0caf25378df61a4ae478548fddd48319e3ec545a2e7f930')

build() {
  arch-meson "CoBang-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
