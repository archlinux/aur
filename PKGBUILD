# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=baloo-widgets-git
pkgver=r410.331c859
pkgrel=1
pkgdesc="A framework for searching and managing metadata"
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kdelibs/baloo'
license=(LGPL)
depends=(baloo)
makedepends=(extra-cmake-modules git kdoctools)
source=('git://anongit.kde.org/baloo-widgets')
provides=(baloo-widgets)
conflicts=(baloo-widgets)
md5sums=('SKIP')

pkgver() {
  cd baloo-widgets
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../baloo-widgets \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
