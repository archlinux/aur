# $Id$
# Maintainer: Jason Scurtu <jscurtu@gmail.com>

pkgname=glade-dev
pkgver=3.19.0
pkgrel=3
pkgdesc="User interface builder for GTK+ and GNOME."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('gtk3' 'libxml2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'python2-gobject' 'itstool' 'docbook-xsl')
optdepends=('python2: Python widgets support'
            'devhelp: help browser')
url="http://glade.gnome.org/"
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=glade.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname%-*}/${pkgver:0:4}/${pkgname%-*}-$pkgver.tar.xz)
sha256sums=('a7a3f6d32fbfcc9b754b48a3410bf025e462bc7898e124f0ad8f64c3d7ad6fa2')

prepare() {
  cd "${pkgname%-*}-$pkgver"
}

build() {
  cd "${pkgname%-*}-$pkgver"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "${pkgname%-*}-$pkgver"
  make DESTDIR="$pkgdir" install
}
