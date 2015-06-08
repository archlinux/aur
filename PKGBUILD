# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=libkgeomap-frameworks-git
pkgver=5.0.0.r623.6b80322
pkgrel=1
pkgdesc='A wrapper around world map components for browsing and arranging photos on a map. KF5 Frameworks branch. (GIT version)'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('marble-git')
makedepends=('git' 'automoc4' 'cmake')
source=('git://anongit.kde.org/libkgeomap#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libkgeomap
  _ver="$(cat CMakeLists.txt | grep -e KGEOMAP_LIB_MAJOR_VERSION -e KGEOMAP_LIB_MINOR_VERSION -e KGEOMAP_LIB_PATCH_VERSION | head -n3 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake  ../libkgeomap \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
