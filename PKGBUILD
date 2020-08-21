# Maintainer: Albert Graef <aggraef@cmail.com>
# Contributor: Charles Goyard <cg@fsck.fr>

pkgname=xapian-tcl-bindings
_realname=xapian-bindings
pkgver=1.4.16
pkgrel=1
pkgdesc="Bindings allowing Xapian to be used from Tcl"
arch=(i686 x86_64)
url="http://xapian.org/docs/bindings/tcl/"
license=('GPL')
groups=(xapian)
# FIXME: tcllib isn't actually needed, but we pull it in to have the Tcl
# library path set up as needed. By installing into /usr/lib/tcllib, the
# package will hopefully work with whatever Tcl version happens to be
# installed.
depends=('tcl' 'tcllib' 'xapian-core')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-$pkgver.tar.xz)
md5sums=('333b7b2771dca0f07b092490468f75ef')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  ./configure --prefix=/usr --with-tcl TCL_LIB=/usr/lib/tcllib
  make
}

package() {
  cd "$srcdir/${_realname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
