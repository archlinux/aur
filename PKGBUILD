# Maintainer: Micro <microgamercz@proton.me> -> https://github.com/MicrogamerCz

pkgname=piki-git
pkgver=0.4.0.r50.g8da92fb
pkgrel=1
pkgdesc="Unofficial Kirigami client for Pixiv"
arch=(x86_64)
url="https://github.com/MicrogamerCz/Piki"
license=(GPL-3.0-or-later)
depends=(piqi kirigami kirigami-addons ki18n kconfig kwallet purpose kcoreaddons qt6-webengine) # removed futuresql from deps until a feature patch gets merged in the upstream
makedepends=(extra-cmake-modules git)
conflicts=(piki)
provides=(piki)
source=("git+https://github.com/MicrogamerCz/Piki")
sha256sums=('SKIP')

pkgver() {
  cd Piki
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Piki
  git submodule update --init --recursive
}

build() {
  cmake -B build -S Piki \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
