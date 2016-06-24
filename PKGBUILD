# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kparts-git
pkgver=r75.e010894
pkgrel=2
pkgdesc='KParts'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kparts'
license=('LGPL')
depends=('kio-git')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=(kparts)
provides=(kparts)
source=('git://anongit.kde.org/kparts.git')
md5sums=('SKIP')

pkgver() {
  cd kparts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kparts \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
