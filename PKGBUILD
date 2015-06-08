# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kconfig-git
pkgver=r219.da717e6
pkgrel=1
pkgdesc='KConfig'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kconfig'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kconfig)
provides=(kconfig)
source=('git://anongit.kde.org/kconfig.git')
md5sums=('SKIP')

pkgver() {
  cd kconfig
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kconfig \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
