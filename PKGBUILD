# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.7.2
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL2')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('51976a4bd7ba6e0580f8158255cb7d42406d2960de156ce7b24dd027a3a9ae53')

build() {
    arch-meson $pkgname-$pkgver build
    ninja -C build
}

check() {
    ninja test -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
