# Maintainer: Florian Bigard <florian.bigard@gmail.com>
# Thanks to Andrea Scarpino <andrea@archlinux.org>

pkgname=libmygpo-qt5-git
pkgver=1.0.8.2.g7946293
pkgrel=1
pkgdesc="A C++/Qt client library for gpodder.net. Git and Qt5 version."
arch=('i686' 'x86_64')
url="http://wiki.gpodder.org/wiki/Libmygpo-qt"
license=('LGPL2.1')
depends=('qt5-base')
makedepends=('cmake' 'doxygen')
source=("git+https://github.com/gpodder/libmygpo-qt.git" "include_suffix.patch")
sha256sums=('SKIP' '7994f3c29086268b8138e7ac0c0d1a99acfa55e07a7695507f314903b890f79d')
provides=('libmygpo-qt5')
conflicts=('libmygpo-qt5')

pkgver() {
  cd libmygpo-qt
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  cd libmygpo-qt
  patch -Np0 -i "../include_suffix.patch"
  cd ../
  mkdir build
}

build() {
  cd build
  cmake "../libmygpo-qt" \
    -DBUILD_WITH_QT4=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="${pkgdir}" install
}
