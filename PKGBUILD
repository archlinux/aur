# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=microsoft
pkgname=snmalloc
pkgver=0.7.1
pkgrel=1
pkgdesc="Message passing based allocator"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

depends=('glibc')
makedepends=('cmake')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91824fdf553f03cf6ef8be57f29f1d4f79cd651667455e9fe4af8b7c09e705d3')

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
