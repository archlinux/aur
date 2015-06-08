# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=milou-git
pkgver=r393.f70d1ee
pkgrel=1
pkgdesc="A dedicated search application built on top of Baloo"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/milou/'
license=('LGPL')
provides=('milou' 'milou-frameworks-git')
conflicts=('milou' 'milou-frameworks-git')
replaces=('milou-frameworks-git')
depends=('krunner-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=('git://anongit.kde.org/milou')
md5sums=('SKIP')

pkgver() {
  cd milou
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../milou \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DQML_INSTALL_DIR=lib/qt/qml \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
