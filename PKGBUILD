# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml-git
pkgver=1.2.r569.06823bc
pkgrel=1
pkgdesc="Kolab XML Format Schema Definitions Library. (GIT Version)"
url='https://kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git' 'cmake' 'boost' 'xsd' 'swig' 'xerces-c' 'boost-libs')
conflicts=('libkolabxml')
source=('git+https://git.kolab.org/diffusion/LKX/libkolabxml.git')
sha1sums=('SKIP')

pkgver() {
  cd libkolabxml
  _ver="$(cat CMakeLists.txt | grep -m2 -e Libkolabxml_VERSION_MAJOR -e Libkolabxml_VERSION_MINOR | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkolabxml \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
