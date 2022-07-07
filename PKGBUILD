# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=nx-software-center-git
pkgver=1.0.1.r210.g95efb22
pkgrel=2
pkgdesc="Graphical front end to manage AppImage applications built using MauiKit"
arch=(x86_64)
url="https://github.com/Nitrux/nx-software-center"
license=(LGPL2.1)
depends=(mauikit mauikit-filebrowsing libappimage nlohmann-json)
makedepends=(git cmake extra-cmake-modules argagg xxd wget)
provides=(nx-software-center)
conflicts=(nx-software-center)
source=("git+https://github.com/Nitrux/nx-software-center.git")
sha256sums=('SKIP')

pkgver() {
  cd nx-software-center
  git describe --long --tags --exclude latest | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd nx-software-center
  [[ -d build ]] || mkdir build
}

build() {
  cd nx-software-center/build
  cmake .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd nx-software-center/build
  make DESTDIR="${pkgdir}/" install
}
