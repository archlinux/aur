# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kmediaplayer-git
pkgver=r78.9af2878
pkgrel=1
pkgdesc='Plugin interface for media player features'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kmediaplayer'
license=(LGPL)
depends=(kparts-git)
makedepends=(extra-cmake-modules-git git)
groups=(kf5-aids)
conflicts=(kmediaplayer)
provides=(kmediaplayer)
source=('git://anongit.kde.org/kmediaplayer.git')
md5sums=('SKIP')

pkgver() {
  cd kmediaplayer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kmediaplayer \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
