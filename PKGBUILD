# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=libkgeomap-frameworks-git
pkgver=5.0.0.r624.db1814d
pkgrel=1
pkgdesc="A wrapper around world map components for browsing and arranging photos on a map. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('marble-git')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('libkgeomap')
source=('git://anongit.kde.org/libkgeomap#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libkgeomap
  _ver="$(cat CMakeLists.txt | grep -m3 -e _LIB_MAJOR_VERSION -e _LIB_MINOR_VERSION -e _LIB_PATCH_VERSION | cut -d '"' -f2 | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
