# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtk-vnc-gtk2
_pkgname=gtk-vnc
pkgver=0.5.1
pkgrel=1
pkgdesc="A VNC viewer widget for GTK build for GTK2 only"
arch=('i686' 'x86_64')
url="http://live.gnome.org/gtk-vnc"
license=('LGPL')
depends=('libgcrypt' 'gtk2')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
makedepends=('intltool' 'pygtk' 'pygobject2-devel' 'gtk-doc' 'gtk2' 'vala' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('1ad1847a23f8ea8fbf2396de46c51ec0900ee3698cde4e205760518cd1e01a40')

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
