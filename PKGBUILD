# $Id$
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Maintainer: TingPing <tingping@tingping.se>

pkgname=glade-git
_gitname=glade
pkgver=3.20.0.r217.g7f336d4
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
source=("git://git.gnome.org/$_gitname")
sha256sums=(SKIP)

pkgver() {
  cd "$_gitname"

  _minor_ver=`pcregrep -o1 '^m4_define\(glade_minor_version, (\d+)\)$' ./configure.ac`
  _micro_ver=`pcregrep -o1 '^m4_define\(glade_micro_version, (\d+)\)$' ./configure.ac`
  _rev=`git describe | sed 's/^GLADE[^-]*-/r/; s/-/./'`
  echo "3.$_minor_ver.$_micro_ver.$_rev"
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
