# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtk-vnc-gtk2
_pkgname=gtk-vnc
pkgver=0.9.0
pkgrel=1
pkgdesc="A VNC viewer widget for GTK built for GTK2 only"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/gtk-vnc"
license=('LGPL')
depends=('libgcrypt' 'gtk2' 'libpulse')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
makedepends=('intltool' 'pygtk' 'pygobject-devel' 'gtk-doc' 'gtk2' 'vala' 'gobject-introspection')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('3a9a88426809a5df2c14353cd9839b8c8163438cb708b31d8048c79d180fcab7')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --with-python --with-examples --disable-static --with-gtk=2.0
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
