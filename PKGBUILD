# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.10.1
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
sha256sums=('aabab76d27deab65bf5bd05cc41d0be6df4a91c5ecd6e886322af6a8a3413029')

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
