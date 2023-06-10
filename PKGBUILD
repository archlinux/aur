# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.8.27
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL')
depends=('gtk3' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib' 'gi-docgen')
source=("https://github.com/AravisProject/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('30db6b03f2a49088746b8f709a690d6819a31ba3a95ad2131ffae6698bd11f55')

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
