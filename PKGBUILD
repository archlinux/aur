# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=nx-software-center
pkgver=1.1.1+13+gde091d0
pkgrel=1
pkgdesc="Graphical front end to manage AppImage applications built with MauiKit"
arch=(x86_64)
url="https://github.com/Nitrux/nx-software-center"
license=(LGPL2.1)
depends=(mauikit mauikit-filebrowsing libappimage appimageupdate hicolor-icon-theme
         # namcap implict depends
         glibc gcc-libs qt5-base qt5-declarative ki18n5 kcoreaddons5)
makedepends=(git cmake extra-cmake-modules)
source=("git+https://github.com/Nitrux/nx-software-center.git#commit=de091d0fb50dae41992bd3766ce7a676208defc2")
sha256sums=('SKIP')

pkgver() {
  cd nx-software-center
  git describe --tags --exclude latest | sed 's/^v//;s/-/+/g'
  # patch for mauikit3 support don't apply, using fixed commit
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
