# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-logger-qt-git
pkgver=r292.332b933
pkgrel=1
pkgdesc='Qt Wrapper around TpLogger client library'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-qt5' 'telepathy-logger')
makedepends=('extra-cmake-modules' 'git' 'doxygen')
conflicts=('telepathy-logger-qt')
provides=('telepathy-logger-qt')
source=("git://anongit.kde.org/telepathy-logger-qt.git")
sha256sums=('SKIP')

pkgver() {
  cd telepathy-logger-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

# use python2
  sed -e 's|#!/usr/bin/python|#!/usr/bin/python2|' -i telepathy-logger-qt/tools/*.py
}

build() {
  cd build
  cmake ../telepathy-logger-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
