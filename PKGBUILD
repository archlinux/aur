# Maintainer: kraxarn <me@kraxarn.com>

pkgname=kirigami-gallery-git
pkgver=r171.fda9443
pkgrel=1
pkgdesc='Gallery application built using Kirigami'
arch=('i686' 'x86_64')
url='https://github.com/KDE/kirigami-gallery'
license=(LGPL)
depends=(kirigami2 qt5-svg)
makedepends=(extra-cmake-modules qt5-tools git)
conflicts=(kirigami-gallery)
provides=(kirigami-gallery)
source=('git://github.com/KDE/kirigami-gallery.git')
groups=(kde-applications kdesdk)
md5sums=('SKIP')

pkgver() {
  cd kirigami-gallery
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kirigami-gallery \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make $MAKEFLAGS
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
