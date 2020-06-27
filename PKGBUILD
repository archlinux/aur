# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=bluedevil-git
pkgver=r2124.020c8ab5
pkgrel=1
pkgdesc='KDE bluetooth framework'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/extragear/base/bluedevil'
license=(GPL2)
depends=(bluez-qt-git kio-git)
makedepends=(extra-cmake-modules-git git)
provides=(bluedevil)
conflicts=(bluedevil)
install=$pkgname.install
source=('git+https://github.com/KDE/bluedevil.git')
groups=('plasma')
sha256sums=('SKIP')

pkgver() {
  cd bluedevil
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../bluedevil \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
