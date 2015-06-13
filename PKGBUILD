# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkolabxml-frameworks-git
pkgver=1.1.r556.8f2a9e6
pkgrel=1
pkgdesc="Kolab XML Format Schema Definitions Library. KF5 Frameworks branch. (GIT Version)"
url='https://kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('xerces-c' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'xsd' 'swig')
conflicts=('libkolabxml')
source=('git+https://git.kolab.org/diffusion/LKX/libkolabxml.git#branch=dev/frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libkolabxml
  _ver="$(cat CMakeLists.txt | grep -m2 -e Libkolabxml_VERSION_MAJOR -e  Libkolabxml_VERSION_MINOR | grep -o "[[:digit:]]*" | xargs)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkolabxml \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT5_BUILD=ON \
    -DBUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}