# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kwrited-git
pkgver=r272.57af491
pkgrel=1
pkgdesc='Kwrited'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('kpty-git' 'knotifications-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
conflicts=('kwrited')
provides=('kwrited')
source=('git://anongit.kde.org/kwrited.git')
md5sums=('SKIP')

pkgver() {
  cd kwrited
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwrited/${DIR} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_AS_EXECUTABLE=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
