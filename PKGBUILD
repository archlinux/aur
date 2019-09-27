# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.7.1
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL2')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('e89d98a7b7920b5ea754e8e6a841499d93faecbd4f5b9e7dc0cef6f353b4db5f')

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
