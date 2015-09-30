# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libksane-frameworks-git
pkgver=5.1.0.r400.f855773
pkgrel=1
pkgdesc='A image scanning library that provides a QWidget that contains all the logic needed to interface a sacanner. KF5 Frameworks branch. (GIT version)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdegraphics/libs/libksane'
license=('LGPL')
depends=('kwallet' 'sane' 'ktextwidgets')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('libksane')
source=('git://anongit.kde.org/libksane#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libksane
  _ver="$(cat CMakeLists.txt | grep -m1 KF5_VERSION | cut -d '"' -f2 | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
