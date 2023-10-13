# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=nx-software-center-git
pkgver=1.1.1.r13.gde091d0
pkgrel=1
pkgdesc="Graphical front end to manage AppImage applications built using MauiKit"
arch=(x86_64)
url="https://github.com/Nitrux/nx-software-center"
license=(LGPL2.1)
depends=(mauikit mauikit-filebrowsing libappimage appimageupdate hicolor-icon-theme
         # namcap implict depends
         glibc gcc-libs qt5-base qt5-declarative ki18n5 kcoreaddons5)
makedepends=(git cmake extra-cmake-modules)
provides=(nx-software-center)
conflicts=(nx-software-center)
source=("git+https://github.com/Nitrux/nx-software-center.git")
sha256sums=('SKIP')

pkgver() {
  cd nx-software-center
  git describe --long --tags --exclude latest | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "nx-software-center" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
