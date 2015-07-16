# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kross-git
pkgver=r95.78b3de7
pkgrel=1
pkgdesc='Multi-language application scripting'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kross'
license=(LGPL)
depends=(kparts-git)
makedepends=(extra-cmake-modules-git git kdoctools-git qt5-tools)
groups=(kf5-aids)
conflicts=(kross)
provides=(kross)
source=('git://anongit.kde.org/kross.git')
md5sums=('SKIP')

pkgver() {
  cd kross
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kross \
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
