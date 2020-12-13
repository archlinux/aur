# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=knewstuff-git
pkgver=v4.100.0.rc1.r791.gee3330a8
pkgrel=2
pkgdesc='KNewStuff'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/knewstuff'
license=('LGPL')
depends=('kio-git' 'kpackage-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(knewstuff)
provides=(knewstuff)
source=('git+https://github.com/KDE/knewstuff.git')
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
  cmake ../knewstuff \
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
