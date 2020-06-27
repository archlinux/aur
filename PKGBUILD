# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=knotifications-git
pkgver=v4.100.0.rc1.r459.ged8dbab
pkgrel=1
pkgdesc='KNotifications'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/knotifications'
license=(LGPL)
depends=(libdbusmenu-qt5 phonon-qt5 kwindowsystem-git kcodecs-git kconfig-git kcoreaddons-git)
makedepends=(extra-cmake-modules-git git qt5-tools python)
groups=(kf5)
conflicts=(knotifications)
provides=(knotifications)
source=('git+https://github.com/KDE/knotifications.git')
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
  cmake ../knotifications \
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
