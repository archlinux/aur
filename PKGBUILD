# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=khtml-git
pkgver=r233.093c96c
pkgrel=1
pkgdesc='KHtml'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/khtml'
license=(LGPL)
depends=(kparts-git kjs-git giflib)
makedepends=(extra-cmake-modules-git git)
groups=(kf5-aids)
conflicts=(khtml)
provides=(khtml)
source=('git://anongit.kde.org/khtml.git')
md5sums=('SKIP')

pkgver() {
  cd khtml
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../khtml \
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
