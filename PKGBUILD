# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcmutils-git
pkgver=r103.f3e45a3
pkgrel=3
pkgdesc='Utilities for interacting with KCModules'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kcmutils'
license=('LGPL')
depends=('kdeclarative-git')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=('kcmutils')
provides=('kcmutils')
source=('git://anongit.kde.org/kcmutils.git')
md5sums=('SKIP')

pkgver() {
  cd kcmutils
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcmutils \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
