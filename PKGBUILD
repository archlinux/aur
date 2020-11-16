# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=libhttpserver
pkgver=0.18.2
pkgrel=1
pkgdesc="C++ library for creating an embedded Rest HTTP server (and more)"
arch=('i686' 'x86_64')
url="https://github.com/etr/libhttpserver"

license=('BSD')

depends=(libmicrohttpd)
conflicts=(libhttpserver-git)
makedepends=(gcc libtool)
source=("https://github.com/etr/libhttpserver/archive/${pkgver}.tar.gz")
sha256sums=('1dfe548ac2add77fcb6c05bd00222c55650ffd02b209f4e3f133a6e3eb29c89d')

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
