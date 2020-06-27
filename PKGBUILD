# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_gitname=kgamma5
pkgname=$_gitname-git
pkgver=r422.a49ea60
pkgrel=1
pkgdesc="Adjust your monitor's gamma settings"
arch=(i686 x86_64)
url='https://projects.kde.org/kgamma5'
license=(LGPL)
depends=(kdelibs4support)
makedepends=(extra-cmake-modules git kdoctools)
conflicts=(kgamma5 kdegraphics-kgamma kgamma-git)
provides=(kgamma5)
replaces=(kgamma-git)
source=('git+https://github.com/KDE/kgamma5.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
