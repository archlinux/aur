# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=microsoft
pkgname=snmalloc
pkgver=0.7.2
pkgrel=1
pkgdesc="Message passing based allocator"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

depends=('glibc' 'gcc-libs')
provides=("${pkgname}")
makedepends=('cmake')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('580e4a1445f6a6a294728363856cea6b4a6ae40fc42e02d9687271bed9c5386b')

build() {
  cd "${pkgname}-${pkgver}" || exit 1

  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SNMALLOC_NO_REALLOCARR=OFF \
    -D SNMALLOC_NO_REALLOCARRAY=OFF \
    -D SNMALLOC_STATIC_LIBRARY=OFF

  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}" || exit 1

  DESTDIR="${pkgdir}" cmake --install build

  install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "./README.md"

  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "./LICENSE"
}
