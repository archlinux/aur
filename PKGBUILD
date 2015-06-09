# $Id$
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Maintainer: TingPing <tingping@tingping.se>

pkgname=glade-git
_gitname=glade
pkgver=3.18.0.55f8a6d
pkgrel=1
pkgdesc="User interface builder for GTK+ and GNOME."
provides=('glade')
conflicts=('glade')
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('gtk3' 'libxml2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection' 'python2-gobject' 'itstool' 'docbook-xsl'
			 'gnome-common')
optdepends=('python2: Python widgets support'
            'devhelp: help browser')
url="http://glade.gnome.org/"
install=glade.install
source=("git://git.gnome.org/$_gitname")
sha256sums=(SKIP)

pkgver() {
  cd "$_gitname"
  rev=`git rev-parse --short HEAD`
  echo "3.18.0.$rev"
}

build() {
  cd "$_gitname"
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
