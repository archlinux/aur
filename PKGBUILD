# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cobang
pkgver=0.10.2
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('GPL3')
depends=(
  'gst-plugin-gtk'
  'gst-plugins-good'
  'gst-python'
  'libhandy'
  'libndp'
  'libnm'
  'libpwquality'
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
sha256sums=('c5268a23a8b59dc7fc0976c8a06622f971afa90f78c19d17489a50f21869af25')

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
