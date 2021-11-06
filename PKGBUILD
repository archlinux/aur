# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.9.5
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=('gst-plugin-gtk' 'gst-plugins-good' 'gst-python' 'libnm' 'python-gobject' 
         'python-kiss-headers' 'python-logbook' 'python-pillow' 'python-requests'
         'python-single-version' 'zbar')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('53d021aa15bc9ee5ce94f37aa9e402f1dcf43228c09f04608c85b559bf518f6c')

prepare() {
  cd "CoBang-$pkgver"

  # Correct version in About dialog
  sed -i 's/0.9.4/0.9.5/g' meson.build
}

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
