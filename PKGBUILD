# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=solid-git
pkgver=r196.25657e3
pkgrel=1
pkgdesc='Solid'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/solid'
license=('LGPL')
depends=('qt5-declarative' 'media-player-info' 'udisks2' 'upower')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(solid)
provides=(solid)
source=('git://anongit.kde.org/solid.git')
md5sums=('SKIP')

pkgver() {
  cd solid
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../solid \
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
