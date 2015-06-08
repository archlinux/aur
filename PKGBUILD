# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcodecs-git
pkgver=r57.b88a81a
pkgrel=1
pkgdesc='Plugins allowing Qt applications to access further types of images'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kcodecs'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kcodecs)
provides=(kcodecs)
source=('git://anongit.kde.org/kcodecs.git')
md5sums=('SKIP')

pkgver() {
  cd kcodecs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcodecs \
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
