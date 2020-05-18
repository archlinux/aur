# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=libhttpserver
pkgver=0.18.0
pkgrel=1
pkgdesc="C++ library for creating an embedded Rest HTTP server (and more)"
arch=('i686' 'x86_64')
url="https://github.com/etr/libhttpserver"

license=('BSD')

depends=(libmicrohttpd)
conflicts=(libhttpserver-git)
makedepends=(gcc libtool)
source=("https://github.com/etr/libhttpserver/archive/${pkgver}.tar.gz")
sha256sums=('b4a745a9f32a1ac02b545c062fc85342a655c3770cd8d4d7218f34509ea27d98')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./bootstrap
  mkdir -p build
  cd build
  ../configure --prefix=$pkgdir/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd build
  make install
}
