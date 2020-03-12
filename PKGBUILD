# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=karchive-git
pkgver=v5.68.0.rc1.r1.g17d4092
pkgrel=1
pkgdesc='Qt 5 addon providing access to numerous types of archives'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/karchive'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(karchive)
provides=(karchive)
source=('git://anongit.kde.org/karchive.git')
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
  cmake ../karchive \
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
