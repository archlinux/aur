# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: SiD

pkgname=leafpad-noheader
_pkgname=leafpad
pkgver=0.8.18.1
pkgrel=2
pkgdesc="A notepad clone for GTK+ 2.0 with print header disabled"
arch=('i686' 'x86_64')
url="http://tarot.freeshell.org/leafpad/"
license=('GPL')
depends=('gtk2' 'desktop-file-utils')
makedepends=('intltool')
conflicts=('leafpad')
provides=('leafpad')
install=leafpad.install
source=(http://download.savannah.gnu.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz gtkprint.c.diff)

md5sums=('254a72fc67505e3aa52884c729cd7b97'
         'a01afce5b77fd78845e1d4985fd3c0f7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p0 <../gtkprint.c.diff
  ./configure --prefix=/usr --enable-chooser
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo 'StartupNotify=true' >> "${pkgdir}/usr/share/applications/leafpad.desktop"
}

