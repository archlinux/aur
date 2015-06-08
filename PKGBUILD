# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonnet-git
pkgver=r146.a5b7c87
pkgrel=1
pkgdesc='Sonnet'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/sonnet'
license=('LGPL')
depends=('qt5-base' 'enchant')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(sonnet)
provides=(sonnet)
source=('git://anongit.kde.org/sonnet.git')
md5sums=('SKIP')

pkgver() {
  cd sonnet
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../sonnet \
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
