# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=solid-git
pkgver=v4.100.0.rc1.r389.g8dfb727
pkgrel=1
pkgdesc='Solid'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/solid'
license=('LGPL')
depends=('qt5-declarative' 'media-player-info' 'udisks2' 'upower')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(solid)
provides=(solid)
source=('git+https://anongit.kde.org/solid.git')
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
  cmake ../solid \
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
