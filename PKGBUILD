# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwidgetsaddons-git
pkgver=v4.100.0.rc1.r614.gaf8c544
pkgrel=1
pkgdesc='KWidgetsAddons'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kwidgetsaddons'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kwidgetsaddons)
provides=(kwidgetsaddons)
source=('git+https://github.com/KDE/kwidgetsaddons.git')
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
  cmake ../kwidgetsaddons \
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
