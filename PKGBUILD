# Maintainer: lily wilson <hotaru@thinkindifferent.net>

_pkgname=pstoedit
pkgname=$_pkgname-emf
pkgver=3.70
pkgrel=0
pkgdesc="Translates PostScript and PDF graphics into other vector formats, with EMF support"
arch=('i686' 'x86_64')
url="http://www.pstoedit.net/"
license=('GPL')
depends=('gcc-libs' 'plotutils' 'gd' 'imagemagick' 'libemf')
makedepends=('ghostscript')
options=('!makeflags')
conflicts=("$_pkgname")
provides=("$_pkgname=$pkgver")
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-${pkgver}.tar.gz")
sha1sums=('657f8f7070fde1432cd65a34b6b1c4b5b42f8b50')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i 's/-pedantic//' configure
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
