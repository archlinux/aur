# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jonahtan Schaeffer <joschaeffer@gmail.com>
# Contributor: Drake Arconis <lightdrake@gmail.com>

_pkgname=jsoncpp
pkgname=jsoncpp-cs
pkgver=1.0.0
_pkgver=1.0.0
pkgrel=1
pkgdesc='A C++ library for interacting with JSON. Newer version using CMAKE and pkgconfig'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('i686' 'x86_64')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/open-source-parsers/${_pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('4c886ac3bfccc867a79f3a5280ce1152')

conflicts=(${_pkgname})
provides=(${_pkgname})

build() {
  cd ${_pkgname}-${_pkgver}
  rm -rf b
  mkdir -p b
  cd b
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DJSONCPP_WITH_TESTS=OFF \
    -DINCLUDE_INSTALL_DIR:PATH=include/jsoncpp \
    -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
    -DJSONCPP_WITH_PKGCONFIG_SUPPORT=ON \
    -DJSONCPP_WITH_CMAKE_PACKAGE=ON \
    -DJSONCPP_LIB_BUILD_SHARED=ON \
    ..
  cmake --build .
}

package() {
  cd ${_pkgname}-${_pkgver}/b
  DESTDIR="${pkgdir}" cmake --build . --target install
}

