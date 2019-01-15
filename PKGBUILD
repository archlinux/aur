# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.6.1
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL2')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('4f7a8efabad1581a666496f62c578a0fc7b00636f4fcc4fc19b660dc3a274b7a')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-appstream-util \
              --enable-packet-socket \
              --enable-gst-plugin \
              --enable-gtk-doc \
              --enable-usb \
              --enable-viewer \
              --enable-zlib-pc \
              --disable-gst-0.10-plugin
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
