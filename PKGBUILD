# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kparts-git
pkgver=v4.100.0.rc1.r357.gaf3323c
pkgrel=1
pkgdesc='KParts'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kparts'
license=('LGPL')
depends=('kio-git')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=(kparts)
provides=(kparts)
source=('git+https://github.com/KDE/kparts.git')
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
  cmake ../kparts \
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
