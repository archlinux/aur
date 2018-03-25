# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtk-vnc-gtk2
_pkgname=gtk-vnc
pkgver=0.7.1
pkgrel=1
pkgdesc="A VNC viewer widget for GTK built for GTK2 only"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/gtk-vnc"
license=('LGPL')
depends=('libgcrypt' 'gtk2' 'libpulse')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
makedepends=('intltool' 'pygtk' 'pygobject2-devel' 'gtk-doc' 'gtk2' 'vala' 'gobject-introspection')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('f34baa696615ef67666e8465b4d0ac563355e999a77d2cc42ad4625a24f7aab1')

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
