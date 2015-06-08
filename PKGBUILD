# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kidletime-git
pkgver=r43.852f6c7
pkgrel=1
pkgdesc='KIdleTime'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kidletime'
license=('LGPL')
depends=('qt5-x11extras' 'libxss')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kidletime)
provides=(kidletime)
source=('git://anongit.kde.org/kidletime.git')
md5sums=('SKIP')

pkgver() {
  cd kidletime
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kidletime \
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
