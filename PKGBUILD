# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=necpp
pkgver=1.5.0.cvs20101003
pkgrel=1
pkgdesc="Free NEC-2 compatable electromagnetic code. It can both read nec2 antenna description files and also be incorporated into other projects like GUI tools and automatic antenna optimization systems."
arch=('i686' 'x86_64')
url="http://alioth.debian.org/projects/necpp/"
license=('GPL')
options=(!libtool)
source=(http://ftp.de.debian.org/debian/pool/main/n/${pkgname}/${pkgname}_${pkgver%.*}+${pkgver##*.}.orig.tar.gz)
md5sums=('122bf50da6b7a5a33c06499063538f4b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver%.*}+${pkgver##*.}"
	
#	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.in
  make -f Makefile.cvs
  ./configure --prefix=/usr --without-lapack
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver%.*}+${pkgver##*.}"
  
	make DESTDIR="${pkgdir}/" install
}
