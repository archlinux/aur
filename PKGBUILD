# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcmutils-git
pkgver=v5.71.0.rc1.r4.g0d4ea51
pkgrel=1
pkgdesc='Utilities for interacting with KCModules'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kcmutils'
license=('LGPL')
depends=('kdeclarative-git')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=('kcmutils')
provides=('kcmutils')
source=('git+https://github.com/KDE/kcmutils.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcmutils \
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
