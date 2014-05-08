# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtk-vnc-gtk2
_pkgname=gtk-vnc
pkgver=0.5.3
pkgrel=1
pkgdesc="A VNC viewer widget for GTK build for GTK2 only"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/gtk-vnc"
license=('LGPL')
depends=('libgcrypt' 'gtk2')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
makedepends=('intltool' 'pygtk' 'pygobject2-devel' 'gtk-doc' 'gtk2' 'vala' 'gobject-introspection')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('d490a6c8f40e550d43aef0043ce3bec498ec220d5eb3dc5cdcff8fd561149caf')

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
