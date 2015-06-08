# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=powerdevil-git
pkgver=r1619.a559a93
pkgrel=1
pkgdesc='KDE power management tools'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('plasma-workspace-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
conflicts=('powerdevil')
provides=('powerdevil')
source=('git://anongit.kde.org/powerdevil.git')
md5sums=('SKIP')

pkgver() {
  cd powerdevil
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../powerdevil \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
