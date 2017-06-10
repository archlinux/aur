# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=elektra
pkgver=0.8.19
pkgrel=2
pkgdesc="Elektra is a universal hierarchical configuration store"
url="http://freedesktop.org/wiki/Software/Elektra"
license=("BSD")
arch=('i686' 'x86_64' 'lua')
depends=('libxml2' 'yajl' 'qt5-base' 'python' 'curl')
makedepends=('docbook-xsl' 'cmake' 'doxygen')
source=(https://github.com/ElektraInitiative/ftp/raw/master/releases/elektra-$pkgver.tar.gz)
sha256sums=('cc14f09539aa95623e884f28e8be7bd67c37550d25e08288108a54fd294fd2a8')

build() {
  cd ${srcdir}/$pkgname-$pkgver
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
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}
