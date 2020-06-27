# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_gitname=kpimtextedit
pkgname=$_gitname-git
pkgver=r1241.9cd49c7
pkgrel=1
pkgdesc="A textedit with PIM-specific features"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/kde/pim/$_gitname"
license=(LGPL)
depends=(kdelibs4support grantlee-qt5)
makedepends=(extra-cmake-modules-git git python kdoctools)
conflicts=("$_gitname")
provides=("$_gitname")
source=('git+https://github.com/KDE/kpimtextedit.git')
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
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
