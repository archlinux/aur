# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.5.10
_release=ARAVIS_0_5_10
pkgrel=1
pkgdesc="A vision library for genicam based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=(LGPL)
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=(https://github.com/AravisProject/aravis/archive/${_release}.tar.gz)
sha256sums=('00731b8319b7c99bd302b5c198598602f22e0912c51c9f552864fc13e74849fa')

build() {
  cd $pkgname-$_release
  ./autogen.sh --prefix=/usr \
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
  cd $pkgname-$_release
  make -k check
}

package() {
  cd $pkgname-$_release
  make DESTDIR="${pkgdir}" install
}
