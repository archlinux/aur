# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.8.0
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('e36cae575f2afdb416d56437baf8740717a59ef0364f79f33181e87762fe2dcf')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
