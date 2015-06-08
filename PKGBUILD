# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-plugins-frameworks-git
pkgver=r333.998049c
pkgrel=1
pkgdesc='Plugins for Dolphin. KF5 Frameworks branch. (GIT Version)'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
url="https://projects.kde.org/projects/kde/kdesdk/dolphin-plugins"
depends=('dolphin-git')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
conflicts=('dolphin-plugins')
provides=('dolphin-plugins')
source=('git://anongit.kde.org/dolphin-plugins#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd dolphin-plugins
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake  ../dolphin-plugins \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
