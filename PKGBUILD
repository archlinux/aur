# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.8.15
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://github.com/AravisProject/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('95d59fe77f5e1aea37ef868e96b0ac1a797f80c2810bc9adb06d5d14d4734f93')

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
