#Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=libdap
pkgver=3.14.0
pkgrel=1
pkgdesc="A library which contains an implementation of DAP 2.0 and 3.1"
arch=('i686' 'x86_64')
url="http://www.opendap.org/download/libdap"
license="LGPL2.1"
depends=('curl' 'libxml2' 'util-linux-ng')
source=(http://www.opendap.org/pub/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('83ac4c6eb4aa8e485587de94b9757d01')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # Repeat twice: some flex generated files left around...
  ./configure --prefix=/usr 
  make distclean
  autoreconf --install
  ./configure --prefix=/usr
  make
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
