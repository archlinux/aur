# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kactivities-git
pkgver=r819.d5d8770
pkgrel=1
pkgdesc="Core components for the KDE's Activities"
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kactivities'
license=(LGPL)
depends=(kdeclarative-git kcmutils-git kpackage-git)
provides=(kactivities kactivities-frameworks)
conflicts=(kactivities)
makedepends=(extra-cmake-modules-git git boost)
source=('git://anongit.kde.org/kactivities.git')
md5sums=('SKIP')

pkgver() {
  cd kactivities
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kactivities \
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
