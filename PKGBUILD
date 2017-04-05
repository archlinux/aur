# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtk-vnc-gtk2
_pkgname=gtk-vnc
pkgver=0.7.0
pkgrel=1
pkgdesc="A VNC viewer widget for GTK built for GTK2 only"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/gtk-vnc"
license=('LGPL')
depends=('libgcrypt' 'gtk2' 'libpulse')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
makedepends=('intltool' 'pygtk' 'pygobject2-devel' 'gtk-doc' 'gtk2' 'vala' 'gobject-introspection')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('3c2eae7c9053338939a32c9987156a12b802ffd5c7f80702ba8d483dfc6d483e')

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
