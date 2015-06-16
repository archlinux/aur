# Maintainer: Ciriaco Garcia de Celis <cgarcia at etherpilot.com>
pkgname=qpid-proton
pkgver=0.9.1
pkgrel=1
pkgdesc="Proton is a high-performance, lightweight messaging library"
arch=('i686' 'x86_64' 'armv7h')
url="https://qpid.apache.org/releases/"
license=('APACHE')
depends=('python2')
makedepends=('util-linux' 'python2' 'cmake' 'swig')
optdepends=()
source=("http://www.eu.apache.org/dist/qpid/proton/$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('98008d90acd0d47cbd7ac1572a2bb50b452338ed')

build() {
  cd "${srcdir}/qpid-proton-${pkgver}-rc1"
  mkdir build
  cd build
  cmake .. -DSYSINSTALL_BINDINGS=ON -DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
  -DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
  -DPYTHON_LIBRARY=/lib/libpython2.7.so -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_PHP=OFF -DBUILD_RUBY=OFF -DBUILD_PERL=OFF -DBUILD_JAVA=OFF -DBUILD_PYTHON=ON \
  -DCMAKE_INSTALL_LIBDIR=/lib -DLIB_SUFFIX=""
  make
}

package() {
  cd "${srcdir}/qpid-proton-${pkgver}-rc1/build"
  make DESTDIR="${pkgdir}/" install
}
