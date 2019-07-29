# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=elisa-git
pkgver=0.4.0.r61.gbe00ded
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A simple music player for KDE aiming to provide a nice experience for its users"
url="https://community.kde.org/Elisa"
license=(LGPL3)
depends=(qt5-quickcontrols2 kcmutils baloo kirigami2)
makedepends=(git python extra-cmake-modules kdoctools)
provides=(elisa)
conflicts=(elisa)
source=("git+https://anongit.kde.org/elisa.git")
sha512sums=('SKIP')

pkgver() {
  cd elisa
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../elisa \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
