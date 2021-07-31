# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.8.16
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://github.com/AravisProject/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('b3aec0d008e5ebb736f958f8b711a63e6bf802afe1c074a895818abe93d04f37')

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
