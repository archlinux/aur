# Maintainer: Philipp Claßen <philipp.classen@gmx.net>
pkgname=libhttpserver-git
pkgver=r420.4cbfc1f
pkgrel=1
pkgdesc="C++ library for creating an embedded Rest HTTP server (and more)"
arch=('i686' 'x86_64')
url="https://github.com/etr/libhttpserver"

license=('BSD')

depends=(libmicrohttpd)
makedepends=(gcc libtool)
source=('git://github.com/etr/libhttpserver.git')
md5sums=('SKIP')

pkgver() {
  cd libhttpserver
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/libhttpserver"
  ./bootstrap
  mkdir -p build
  cd build
  CXX=g++ CC=gcc ../configure --prefix=$pkgdir/usr --enable-cpp11
  make
}

package() {
  cd "${srcdir}/libhttpserver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/libhttpserver/LICENSE"
  
  cd build
  make install
}
