# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kunitconversion-git
pkgver=r87.366d2ff
pkgrel=1
pkgdesc='KUnitConversion'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kunitconversion'
license=('LGPL')
depends=('ki18n-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kunitconversion)
provides=(kunitconversion)
source=('git://anongit.kde.org/kunitconversion.git')
md5sums=('SKIP')

pkgver() {
  cd kunitconversion
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kunitconversion \
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
