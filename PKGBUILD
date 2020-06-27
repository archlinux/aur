# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwindowsystem-git
pkgver=v4.100.0.rc1.r413.gfa31de1
pkgrel=1
pkgdesc='KWindowSystem'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kwindowsystem'
license=('LGPL')
depends=('qt5-x11extras' 'libxfixes')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kwindowsystem)
provides=(kwindowsystem)
source=('git+https://github.com/KDE/kwindowsystem.git')
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
  cmake ../kwindowsystem \
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
