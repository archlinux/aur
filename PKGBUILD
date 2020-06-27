# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=powerdevil-git
pkgver=r2318.7575fea0
pkgrel=1
pkgdesc='KDE power management tools'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('plasma-workspace-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
conflicts=('powerdevil')
provides=('powerdevil')
source=('git+https://github.com/KDE/powerdevil.git')
groups=('plasma')
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
