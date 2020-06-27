# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kjs-git
pkgver=r288.6be4429
pkgrel=1
pkgdesc='Support for JS scripting in applications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kjs'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git')
groups=('kf5-aids')
conflicts=('kjs')
provides=('kjs')
source=('git+https://github.com/KDE/kjs.git')
md5sums=('SKIP')

pkgver() {
  cd kjs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kjs \
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
