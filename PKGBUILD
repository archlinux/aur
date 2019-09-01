# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.6.4
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL2')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('b595a4724da51d0fdb71f2b6e2f1e12f328e423155c3e84607ee2ce704f516bd')

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
