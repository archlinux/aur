# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kitemmodels-git
pkgver=r49.680c777
pkgrel=1
pkgdesc='KItemModels'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kitemmodels'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kitemmodels)
provides=(kitemmodels)
source=('git://anongit.kde.org/kitemmodels.git')
md5sums=('SKIP')

pkgver() {
  cd kitemmodels
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kitemmodels \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
