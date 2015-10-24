#Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
#Contributor:	Jussi Timperi	<gmail.com: jussi.timperi>

pkgname=libvoikko
pkgver=3.8
pkgrel=1
pkgdesc="A library of free Finnish language tools using Malaga"
arch=('i686' 'x86_64')
url="http://voikko.sourceforge.net"
license=('GPL2')
depends=('hfstospell>=0.2.2' 'suomi-malaga-voikko')
makedepends=('python2')
options=(!libtool)
source=(http://www.puimula.org/voikko-sources/libvoikko/${pkgname}-${pkgver}.tar.gz)
md5sums=('5c6bbaf9e9a6ebc9e6e538ed3d62f0b0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed 's|python $(srcdir)|python2 $(srcdir)|g' -i src/Makefile.in
  sed 's|python|python2|g' -i test/AllAutomaticTests.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --enable-hfst --with-dictionary-path=/usr/lib/voikko
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

