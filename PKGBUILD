# Maintainer: AltoXorg <atrl101 AT yahoo.com>
# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Kris McCleary <kris27mc@gmail.com>

_pkgname=libzip
pkgname=lib32-${_pkgname}
pkgver=1.10.1
pkgrel=1
pkgdesc="C library for reading, creating, and modifying zip archives"
url="https://libzip.org"
license=('BSD')
arch=('x86_64')
depends=('lib32-zlib' 'lib32-bzip2' 'lib32-zstd' 'lib32-openssl' 'lib32-gnutls')
makedepends=('cmake')
source=("${url}/download/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318')

build() {
  export CFLAGS="$CFLAGS -m32"
  export CXXFLAGS="$CXXFLAGS -m32"

  cmake -B build -S ${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_TOOLS=OFF \
    -DBUILD_REGRESS=OFF \
    -DBUILD_DOC=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -rf "${pkgdir}/usr/include"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
