# $Id$
# Maintainer : Bhushan shah <bshah@kde.org>
# Contributor : Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-sdk-git
pkgver=r1486.1b90443
pkgrel=1
pkgdesc="Applications useful for Plasma development"
arch=(i686 x86_64)
url='https://projects.kde.org/plasma-sdk'
license=(LGPL)
depends=(plasma-framework ktexteditor knewstuff qt5-webkit)
makedepends=(extra-cmake-modules)
source=("git://anongit.kde.org/plasma-sdk.git")
md5sums=('SKIP')

pkgver() {
  cd plasma-sdk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-sdk \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
