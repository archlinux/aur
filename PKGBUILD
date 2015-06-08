# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-volume-control-git
pkgver=r186.61e7b37
pkgrel=1
pkgdesc='Volume applet for Plasma'
arch=('i686' 'x86_64')
url='http://quickgit.kde.org/?p=scratch%2Fsitter%2Fplasma-volume-control.git'
license=('LGPL')
depends=('pulseaudio' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git')
provides=('plasma-volume-control')
conflicts=('plasma-volume-control')
source=('git://anongit.kde.org/scratch/sitter/plasma-volume-control.git')
md5sums=('SKIP')

pkgver() {
  cd plasma-volume-control
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-volume-control \
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
