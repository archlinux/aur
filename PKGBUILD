#Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname=libdap
pkgver=3.20.5
pkgrel=1
pkgdesc="A library which contains an implementation of DAP 2.0 and 3.1"
arch=('i686' 'x86_64')
url="https://www.opendap.org/index.php/software/libdap"
license=('LGPL2.1')
depends=('curl' 'libxml2' 'util-linux' 'libtirpc')
source=(http://www.opendap.org/pub/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('85b69dc8a5c86ae980b450097d0c0453')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr CPPFLAGS="$CPPFLAGS -I/usr/include/tirpc" \
    LIBS='-ltirpc'
  make
  make check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
