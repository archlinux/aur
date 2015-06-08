# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=knotifyconfig-git
pkgver=r62.9fcec57
pkgrel=1
pkgdesc='KNotifyConfig'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/knotifyconfig'
license=('LGPL')
depends=('kio-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(knotifyconfig)
provides=(knotifyconfig)
source=('git://anongit.kde.org/knotifyconfig.git')
md5sums=('SKIP')

pkgver() {
  cd knotifyconfig
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../knotifyconfig \
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
