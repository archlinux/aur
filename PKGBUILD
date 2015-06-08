# Maintainer: Antonio Rojas 

pkgname=kpeople-git
pkgver=r991.77a5fab
pkgrel=1
pkgdesc='A library that provides access to all contacts and the people who hold them'
arch=(i686 x86_64)
url='http://community.kde.org/KTp/libkpeople'
license=(LGPL)
depends=(kwidgetsaddons-git kitemviews-git)
makedepends=(extra-cmake-modules-git git python)
conflicts=(kpeople)
provides=(kpeople)
source=("git://anongit.kde.org/kpeople.git")
sha256sums=('SKIP')

pkgver() {
  cd kpeople
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kpeople \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
