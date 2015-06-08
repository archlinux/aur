# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libmediawiki-frameworks-git
pkgver=r96.69695da
pkgrel=1
pkgdesc='A KDE C++ interface for MediaWiki based web service as wikipedia.org. KF5 Frameworks branch (GIT version)'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kcoreaddons')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'cmake' 'python')
conflicts=('libmediawiki')
provides=('libmediawiki')
source=('git://anongit.kde.org/libmediawiki#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd libmediawiki
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake  ../libmediawiki \
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