# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=threadweaver-git
pkgver=r222.c2a2eea
pkgrel=1
pkgdesc='ThreadWeaver'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/threadweaver'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(threadweaver)
provides=(threadweaver)
source=('git://anongit.kde.org/threadweaver.git')
md5sums=('SKIP')

pkgver() {
  cd threadweaver
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../threadweaver \
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
