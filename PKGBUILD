# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libksane-frameworks-git
pkgver=0.3.0.r389.6601e5c
pkgrel=1
pkgdesc='A image scanning library that provides a QWidget that contains all the logic needed to interface a sacanner. KF5 Frameworks branch. (GIT version)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdegraphics/libs/libksane'
license=('LGPL')
depends=('kwallet' 'sane' 'ktextwidgets')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('libksane')
source=('git://anongit.kde.org/libksane#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libksane
  _ver="$(cat CMakeLists.txt | grep -e KSANE_LIB_MAJOR_VERSION -e KSANE_LIB_MINOR_VERSION -e KSANE_LIB_PATCH_VERSION | head -n3 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libksane \
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
