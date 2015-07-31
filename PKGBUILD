# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=kgamma
pkgname=$_gitname-git
pkgver=r286.a973be8
pkgrel=1
pkgdesc="Adjust your monitor's gamma settings"
arch=(i686 x86_64)
url='https://projects.kde.org/kgamma'
license=(LGPL)
depends=(kdelibs4support)
makedepends=(extra-cmake-modules git kdoctools)
conflicts=(kgamma kdegraphics-kgamma)
provides=(kgamma)
#install=$pkgname.install
source=("git://anongit.kde.org/$_gitname.git")
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
