# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.10
pkgrel=1
pkgdesc="Gtk3 widget for displaying rasterized maps"
url="http://projects.gnome.org/libchamplain/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('clutter-gtk' 'libsoup' 'cairo' 'sqlite')
makedepends=('gobject-introspection' 'gtk-doc' 'vala')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:4}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('bf53ceb2405d4e23a14596a53ecc2a821b003f8c69de4a7de3a39d6e99462b05')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static --disable-debug --enable-vala

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
