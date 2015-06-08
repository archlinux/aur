# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeclarative-git
pkgver=r313.d27b914
pkgrel=1
pkgdesc='KDeclarative'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kdeclarative'
license=(LGPL)
depends=(kpackage-git kio-git libepoxy)
makedepends=(extra-cmake-modules-git git)
conflicts=(kdeclarative)
provides=(kdeclarative)
source=('git://anongit.kde.org/kdeclarative.git')
md5sums=('SKIP')

pkgver() {
  cd kdeclarative
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdeclarative \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
