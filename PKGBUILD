# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=purpose-git
pkgver=r970.6563124
pkgrel=1
pkgdesc="Framework for providing abstractions to get the developer's purposes fulfilled"
arch=(i686 x86_64)
url='https://projects.kde.org/projects/playground/libs/purpose'
license=(LGPL)
depends=(kio-git kdeclarative-git kaccounts-integration-git)
makedepends=(extra-cmake-modules-git git python)
provides=(purpose)
conflicts=(purpose-git)
source=("git://anongit.kde.org/purpose.git")
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
  cmake ../purpose \
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
