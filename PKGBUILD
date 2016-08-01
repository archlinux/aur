#Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=libdap
pkgver=3.15.1
pkgrel=1
pkgdesc="A library which contains an implementation of DAP 2.0 and 3.1"
arch=('i686' 'x86_64')
url="http://www.opendap.org/download/libdap"
license=('LGPL2.1')
depends=('curl' 'libxml2' 'util-linux-ng')
source=(http://www.opendap.org/pub/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('31cd4939e5b894049cebccc321fd1b49')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # Repeat twice: some flex generated files left around...
  ./configure --prefix=/usr 
  make distclean
  autoreconf --install
  ./configure --prefix=/usr
  sed -i dds.yy -e 's/part = array/part = libdap::Part::array/' 
  make
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
