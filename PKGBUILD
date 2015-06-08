# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=karchive-git
pkgver=r72.d11c808
pkgrel=1
pkgdesc='Qt 5 addon providing access to numerous types of archives'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/karchive'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(karchive)
provides=(karchive)
source=('git://anongit.kde.org/karchive.git')
md5sums=('SKIP')

pkgver() {
  cd karchive
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../karchive \
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
