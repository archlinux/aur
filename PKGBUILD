# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=elisa-git
pkgver=0.1.1.r80.gd41c7e0
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Elisa Music Player"
url="https://cgit.kde.org/elisa.git/"
license=(GPL)
depends=(qt5-quickcontrols qt5-quickcontrols2
         kcmutils baloo)
makedepends=(git python extra-cmake-modules kdoctools)
source=("${pkgname}::git://anongit.kde.org/elisa.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname} \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
