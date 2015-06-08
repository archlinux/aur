# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kinfocenter-git
pkgver=r901.b0291b0
pkgrel=1
pkgdesc='KInfocenter'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('kdelibs4support-git' 'kcmutils-git' 'kwayland-git' 'pciutils' 'glu' 'libraw1394')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'plasma-framework-git')
conflicts=('kinfocenter' 'kdebase-workspace')
provides=('kinfocenter')
source=('git://anongit.kde.org/kinfocenter.git')
md5sums=('SKIP')

pkgver() {
  cd kinfocenter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kinfocenter \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

