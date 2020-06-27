# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kglobalaccel-git
pkgver=v4.100.0.rc1.r323.ge6790ab
pkgrel=1
pkgdesc='KGlobalAccel'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kglobalaccel'
license=('LGPL')
depends=('qt5-x11extras' 'kconfig-git' 'kcrash-git' 'kdbusaddons-git' 'ki18n-git' 'kwindowsystem-git')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kglobalaccel)
provides=(kglobalaccel)
source=('git+https://github.com/KDE/kglobalaccel.git')
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
  cmake ../kglobalaccel \
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
