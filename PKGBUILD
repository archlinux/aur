# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=nx-software-center-git
pkgver=1.1.1.r6.gf9255c7
pkgrel=2
pkgdesc="Graphical front end to manage AppImage applications built using MauiKit"
arch=(x86_64)
url="https://github.com/Nitrux/nx-software-center"
license=(LGPL2.1)
depends=(mauikit mauikit-filebrowsing libappimage appimageupdate)
makedepends=(git cmake extra-cmake-modules)
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
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_CPR=ON \
    -DUSE_SYSTEM_ZSYNC2=ON \
    -DUSE_SYSTEM_LIBAPPIMAGE=ON \
    -DUSE_SYSTEM_APPIMAGEUPDATE=ON
  make
}

package() {
  cd nx-software-center/build
  make DESTDIR="${pkgdir}/" install
}
