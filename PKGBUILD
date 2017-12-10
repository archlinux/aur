# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.5.10
pkgrel=1
pkgdesc="A vision library for genicam based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=(LGPL)
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('ca1938a9ffa572abfd3c135b31bf8f55a762fbec297141d9d3c50799c489d8f6')

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
