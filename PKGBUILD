# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dolphin-plugins-git
pkgver=r336.cef9dff
pkgrel=1
pkgdesc="Plugins for Dolphin. (GIT Version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdesdk/dolphin-plugins'
license=('GPL' 'LGPL' 'FDL')
depends=('dolphin-git')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python')
conflicts=('dolphin-plugins' 'kdesdk-dolphin-plugins')
source=('git://anongit.kde.org/dolphin-plugins')
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
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
