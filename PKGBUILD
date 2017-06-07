# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=elektra
pkgver=0.8.19
_pkgver=05c925972224afd3fa28f34b9a762364a38f6850
pkgrel=1
pkgdesc="Elektra is a universal hierarchical configuration store"
url="http://freedesktop.org/wiki/Software/Elektra"
license=("BSD")
arch=('i686' 'x86_64' 'lua')
depends=('libxml2' 'yajl' 'qt5-base' 'python' 'curl')
makedepends=('docbook-xsl' 'cmake' 'doxygen')
#source=(ftp://ftp.markus-raab.org/elektra/releases/$pkgname-$pkgver.tar.gz)
source=(https://github.com/ElektraInitiative/ftp/blob/master/releases/elektra-$pkgver.tar.gz)
md5sums=('cdf739ccae3af291c74eb4f9cacc2131')

build() {
  cd ${srcdir}/lib$pkgname-$_pkgver
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DLUA_PROGRAM_PATH=/usr/bin/lua \
        -DLUA_INCLUDE_DIR=/usr/include \
        -DLUA_LIBRARY=/usr/lib/liblua.so ..
  make clean 
  make
}

package() {
  cd ${srcdir}/lib$pkgname-$_pkgver/build
  make DESTDIR=${pkgdir} install
}
