# Maintainer: Antonio Rojas 

pkgname=kscreengenie-git
pkgver=r40.fbe3172
pkgrel=1
pkgdesc='Screenshot Capture Utility'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/graphics/kscreengenie'
license=(GPL)
depends=(libkipi-frameworks-git kdeclarative libkscreen qt5-x11extras xcb-util-cursor)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(kscreengenie ksnapshot kdegraphics-ksnapshot)
provides=(kscreengenie)
install=$pkgname.install
source=("git://anongit.kde.org/kscreengenie.git")
sha256sums=('SKIP')

pkgver() {
  cd kscreengenie
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kscreengenie \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
