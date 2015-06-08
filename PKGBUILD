# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcompletion-git
pkgver=r100.3bff831
pkgrel=1
pkgdesc='KCompletion'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kcompletion'
license=('LGPL')
depends=('kwidgetsaddons-git' 'kconfig-git')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kcompletion)
provides=(kcompletion)
source=('git://anongit.kde.org/kcompletion.git')
md5sums=('SKIP')

pkgver() {
  cd kcompletion
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcompletion \
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
