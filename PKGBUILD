# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas

pkgname=kwayland-git
pkgver=v5.71.0.r1.g396d014
pkgrel=1
pkgdesc='Qt-style Client and Server library wrapper for the Wayland libraries'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
provides=('kwayland')
conflicts=('kwayland')
source=('git+https://github.com/KDE/kwayland.git')
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
  cmake ../kwayland \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
