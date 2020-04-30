# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.7.4
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb' 'python-gobject')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('479c584e84128a448d9fe38e0dbd1e277f58809859e640f77c2578e32b9f7181')

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
