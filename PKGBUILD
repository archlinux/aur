# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.9.9
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-plugin-gtk' 'gst-plugins-good' 'gst-python' 'libhandy' 'libndp'
         'libnm' 'libpwquality' 'polkit' 'python-gobject' 'python-kiss-headers'
         'python-logbook' 'python-pillow' 'python-requests'
         'python-single-version' 'zbar')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5bc3d462b685978d5bc4c6df6c85789fc146e2706fca66408e767d708576f834')

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
