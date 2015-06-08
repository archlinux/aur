# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kitemviews-git
pkgver=r54.3157bc9
pkgrel=1
pkgdesc='KItemViews'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kitemviews'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kitemviews)
provides=(kitemviews)
source=('git://anongit.kde.org/kitemviews.git')
md5sums=('SKIP')

pkgver() {
  cd kitemviews
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kitemviews \
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
