# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.9.1
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://github.com/AravisProject/aravis"
arch=('x86_64' 'aarch64')
license=('LGPL-2.1-or-later')
depends=('gtk3' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('glib2-devel' 'meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('db0eb8df33edf7ecee0921619a679bca8cccd62947c77ed9f878cdbaa1ff068b')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"
}
