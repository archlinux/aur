# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=nx-software-center
pkgver=1.0.1
pkgrel=1
pkgdesc="Graphical front end to manage AppImage applications built with MauiKit"
arch=(x86_64)
url="https://github.com/Nitrux/nx-software-center"
license=(LGPL2.1)
depends=(mauikit mauikit-filebrowsing mauikit-imagetools libappimage)
makedepends=(git cmake extra-cmake-modules)
source=("git+https://github.com/Nitrux/nx-software-center.git#tag=v${pkgver}")
sha256sums=('SKIP')

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
