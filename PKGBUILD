# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kservice-git
pkgver=v4.100.0.rc1.r628.ga8413c5
pkgrel=1
pkgdesc='KService'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kservice'
license=('LGPL')
depends=('ki18n-git' 'kconfig-git' 'kcrash-git' 'kdbusaddons-git' 'karchive-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git' 'python')
groups=('kf5')
conflicts=(kservice)
provides=(kservice)
source=('git+https://github.com/KDE/kservice.git')
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
  cmake ../kservice \
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
