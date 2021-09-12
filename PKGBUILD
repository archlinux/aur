# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.9.3
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-python' 'python-gobject' 'gst-plugin-gtk' 'gst-plugins-good' 'libnm'
         'python-pillow' 'python-logbook' 'python-single-version' 'zbar'
         'python-kiss-headers')
makedepends=('git' 'meson' 'gobject-introspection')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92a7bc6173cc98164be74f53943ca852e759ade662e5b87201faf25847e5fc64')

build() {
  arch-meson "CoBang-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
