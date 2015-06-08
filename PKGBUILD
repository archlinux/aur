# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kservice-git
pkgver=r199.e4dcb34
pkgrel=1
pkgdesc='KService'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kservice'
license=('LGPL')
depends=('ki18n-git' 'kconfig-git' 'kcrash-git' 'kdbusaddons-git' 'karchive-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools' 'python')
groups=('kf5')
conflicts=(kservice)
provides=(kservice)
source=('git://anongit.kde.org/kservice.git')
md5sums=('SKIP')

pkgver() {
  cd kservice
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kservice \
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
