# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.5.12
pkgrel=1
pkgdesc="A vision library for genicam based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=(LGPL)
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('3ba4db545833c642cb10f9078488196b1af6cac96c9dcaf379841d5776fd2c39')

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
  make DESTDIR="${pkgdir}" install
}
