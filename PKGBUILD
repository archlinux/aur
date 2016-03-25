# Maintainer: Daniel Feist <daniel dot feist at mail dot de>
pkgname=qpid-cpp
pkgver=0.34
pkgrel=1
pkgdesc="A connection-oriented messaging API that supports many languages and platforms"
arch=('i686' 'x86_64')
url="http://qpid.apache.org/index.html"
license=('APACHE')
makedepends=('cmake' 'boost')
depends=()
optdepends=('xqilla' 'xerces-c' 'nss' 'nspr' 'libibverbs' 'librdmacm' 'gcc')
source=("http://www.eu.apache.org/dist/qpid/cpp/${pkgver}/qpid-cpp-${pkgver}.tar.gz")  
md5sums=('e9d8ef8a9853ee51698687b9ee8d1b87')

build() {
  cd "${pkgname}-${pkgver}"
  patch -uN src/tests/exception_test.cpp ../../patchfile 
  #mkdir bld
  cd bld
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-std=c++11 -Wno-error=deprecated-declarations" ..
  make all
}

#check() {
#  cd "${pkgname}-${pkgver}/bld"
#  make test
#}

package() {
  cd "${pkgname}-${pkgver}/bld"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin
  mv "${pkgdir}"/usr/lib64/* "${pkgdir}"/usr/lib
  rm -rf "${pkgdir}"/usr/sbin "${pkgdir}"/usr/lib64
}
