# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.8.3
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
sha256sums=('6e6c432e18b090b83d060bb46e7bc980bae57a942d9e6b80dedea4b6931fae32')

build() {
  arch-meson CoBang-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
