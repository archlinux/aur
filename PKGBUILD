# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kplotting-git
pkgver=r42.d4a1a1b
pkgrel=1
pkgdesc='KPlotting'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kplotting'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kplotting)
provides=(kplotting)
source=('git://anongit.kde.org/kplotting.git')
md5sums=('SKIP')

pkgver() {
  cd kplotting
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kplotting \
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
