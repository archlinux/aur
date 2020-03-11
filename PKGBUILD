# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kactivities-git
epoch=2
pkgver=v5.68.0.rc1.r0.g0983cf12
pkgrel=1
pkgdesc="Core components for the KDE's Activities"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kactivities'
license=('LGPL')
depends=('kcmutils-git')
provides=('kactivities' 'kactivities-frameworks')
conflicts=('kactivities')
makedepends=('extra-cmake-modules-git' 'git' 'boost')
source=('git://anongit.kde.org/kactivities.git')
md5sums=('SKIP')

pkgver() {
  cd kactivities
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kactivities \
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
