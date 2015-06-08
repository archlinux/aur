# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdecoration-git
pkgver=r100.31bb399
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules' 'git')
conflicts=('kdecoration')
provides=('kdecoration')
source=('git://anongit.kde.org/kdecoration.git')
md5sums=('SKIP')

pkgver() {
  cd kdecoration
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdecoration \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
