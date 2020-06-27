# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kjobwidgets-git
pkgver=v4.100.0.rc1.r252.g4a3a066
pkgrel=1
pkgdesc='KJobWidgets'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kjobwidgets'
license=('LGPL')
depends=('kcoreaddons-git' 'kwidgetsaddons-git' 'qt5-x11extras')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kjobwidgets)
provides=(kjobwidgets)
source=('git+https://github.com/KDE/kjobwidgets.git')
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
  cmake ../kjobwidgets \
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
