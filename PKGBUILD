# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=elektra
pkgver=0.8.21
pkgrel=1
pkgdesc="Elektra is a universal hierarchical configuration store"
url="https://www.libelektra.org"
license=("BSD")
arch=('i686' 'x86_64' 'lua')
depends=('libxml2' 'yajl' 'qt5-base' 'python' 'curl' 'boost' 'dbus' 'swig')
makedepends=('docbook-xsl' 'cmake' 'doxygen')
source=(https://github.com/ElektraInitiative/libelektra/archive/$pkgver.tar.gz)
sha256sums=('4a0c226efebb51f6639ab30a49c4eacfb0a9ba7d9c8c7449a788fe8a42222c3f')

build() {
  cd ${srcdir}/lib$pkgname-$pkgver
  rm -rf build
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DPLUGINS="ALL" \
        -DTOOLS="ALL" \
        -DBUILD_STATIC=OFF \
        -DBINDINGS="ALL" \
        -DSWIG_EXECUTABLE="/usr/bin/swig" \
        -DLUA_PROGRAM_PATH=/usr/bin/lua \
        -DLUA_INCLUDE_DIR=/usr/include \
        -DLUA_LIBRARY=/usr/lib/liblua.so ..
  make clean 
  make
}

package() {
  cd ${srcdir}/lib$pkgname-$pkgver/build
  make DESTDIR=${pkgdir} install
}
