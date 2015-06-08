# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=khelpcenter-git
pkgver=r2127.238f26d
pkgrel=1
pkgdesc="Application to show KDE Applications' documentation"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/khelpcenter'
license=('LGPL')
depends=('khtml-git' 'kdelibs4support-git' 'kcmutils-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
conflicts=('khelpcenter' 'kdebase-runtime')
provides=('khelpcenter')
source=('git://anongit.kde.org/khelpcenter.git')
md5sums=('SKIP')

pkgver() {
  cd khelpcenter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../khelpcenter/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
