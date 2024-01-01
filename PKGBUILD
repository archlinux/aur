# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='gdcalc'
pkgver='3.4'
pkgrel='1'
pkgdesc='A financial, scientific, statistical & programmers RPN or algebraic calculator'
arch=('i686' 'x86_64')
#url='http://bhepple.com/doku/doku.php?id=dcalcunix'
#url='https://sourceforge.net/projects/gdcalc'
url='https://gitlab.com/wef/gdcalc'
license=('GPL')
depends=('glibc' 'gtk3' 'zlib' 'ncurses' 'at-spi2-core')
depends+=(
  cairo
  gdk-pixbuf2
  glib2
  harfbuzz
  pango
)
_srcdir="${pkgname}-${pkgver}"
source=("${url}/-/archive/${pkgver}/${_srcdir}.tar.gz")
md5sums=('7e9564d7979b5184f6c13f13d10bc5ad')
sha256sums=('c6d10a78e00c6d2d1f79771563fe1be6080d0d36e459451e1ab47dd935e7b4db')

prepare() {
  set -u
  cd "${_srcdir}"
  rm -f 'Makefile'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    sh autogen.sh
  fi
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --sysconfdir='/etc'
  fi
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make install DESTDIR="${pkgdir}" # distdir="${pkgdir}/usr" prefix="${pkgdir}/usr"
  set +u
}
set +u
