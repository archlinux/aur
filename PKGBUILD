# Author: futpib <futpib@gmail.com>

_gitname=kded_rotation
pkgname=kded-rotation-git
pkgver=r4.bcc2f3b
pkgrel=2
pkgdesc='KDED module for handling automatic screen rotation (WIP) '
arch=(i686 x86_64)
url='https://github.com/dos1/kded_rotation'
license=(unknown)
depends=(kded iio-sensor-proxy xorg-xrandr xorg-xinput)
makedepends=(extra-cmake-modules git)
conflicts=()
source=("git://github.com/dos1/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  chmod +x "$pkgdir"/usr/bin/*
}
