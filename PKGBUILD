# Contributor: lily wilson <hotaru@thinkindifferent.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=pstoedit
pkgname=$_pkgname-emf
pkgver=3.73
pkgrel=1
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
sha256sums=('ad31d13bf4dd1b9e2590dccdbe9e4abe74727aaa16376be85cd5d854f79bf290')

prepare() {
  cd ${_pkgname}-$pkgver
  sed -i 's/-pedantic//' configure
}

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
}
