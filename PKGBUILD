# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee-qt4
pkgver=0.5.1
pkgrel=4
pkgdesc="A string template engine based on the Django template system and written in Qt4"
arch=('i686' 'x86_64')
url="https://www.gitorious.org/grantlee/pages/Home"
license=('LGPL3')
depends=('qt4')
makedepends=('cmake' 'doxygen')
source=("http://downloads.grantlee.org/grantlee-${pkgver}.tar.gz")
md5sums=('775f22dac0953029b414ed3b7379098c')

prepare() {
  mkdir build

  sed -e 's|INCLUDE_INSTALL_DIR include|INCLUDE_INSTALL_DIR include/grantlee-qt4|' -i grantlee-$pkgver/CMakeLists.txt
}

build() {
  cd build
  cmake ../grantlee-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
