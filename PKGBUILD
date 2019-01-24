# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='gdcalc'
pkgver='2.20'
pkgrel='1'
pkgdesc='A financial, scientific & programmers RPN or algebraic calculator for X11'
arch=('i686' 'x86_64')
url='http://bhepple.com/doku/doku.php?id=dcalcunix'
license=('GPL')
depends=('gtk2' 'libgnomeui')
depends+=(
  atk
  cairo
  dbus
  dbus-glib
  freetype2
  fribidi
  gconf
  gdk-pixbuf2
  glib2
  gnome-vfs
  gtk2
  harfbuzz
  harfbuzz-icu
  libart-lgpl
  libbonobo
  libbonoboui
  libgnome
  libgnomecanvas
  libgnome-keyring
  libgnomeui
  libpng
  libxml2
  orbit2
  pango
  pixman
)
_srcdir="${pkgname}-${pkgver}"
source=("https://downloads.sourceforge.net/project/gdcalc/${pkgver}/gdcalc-${pkgver}.tar.gz")
md5sums=('46ff91ad381ec6aa0c90c2ca1b649999')
sha256sums=('363cc62a94f163b395b497ff10ee435dbf05746f8b2c7ecbb504ca509d5e5c46')

prepare() {
  set -u
  cd "${_srcdir}"
  rm 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    sh autogen.sh
  fi
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr'
  fi
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make install distdir="${pkgdir}/usr" prefix="${pkgdir}/usr" # DESTDIR="${pkgdir}"
  set +u
}
set +u
