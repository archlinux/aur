# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtk-vnc-gtk2
_pkgname=gtk-vnc
pkgver=0.5.4
pkgrel=1
pkgdesc="A VNC viewer widget for GTK built for GTK2 only"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/gtk-vnc"
license=('LGPL')
depends=('libgcrypt' 'gtk2')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
makedepends=('intltool' 'pygtk' 'pygobject2-devel' 'gtk-doc' 'gtk2' 'vala' 'gobject-introspection')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('488aa97a76ce6868160699cd45d4a0ee0fe6f0ad4631737c6ddd84450f6c9ce7')

build() {
  cd $_pkgname-$pkgver
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
    --with-python --with-examples --disable-static --with-gtk=2.0
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
