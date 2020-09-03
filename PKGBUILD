# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.8.1
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('5fab57711f158f2eec19c32c2b1b87f4e3761df456f23bd330050d91e0f664aa')

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
