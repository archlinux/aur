# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=khotkeys-git
pkgver=r1669.649c690
pkgrel=1
pkgdesc='KHotKeys'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('plasma-workspace-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
conflicts=('khotkeys' 'kdebase-workspace')
provides=('khotkeys')
source=('git://anongit.kde.org/khotkeys.git')
md5sums=('SKIP')

pkgver() {
  cd khotkeys
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../khotkeys \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
