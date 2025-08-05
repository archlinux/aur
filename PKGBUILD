# Past Maintainer: Corwin <corwin@kuiper.dev>
# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=melonds
pkgver=1.0
pkgrel=1
pkgdesc="DS emulator, sorta"
arch=("x86_64" "i686" "pentium4" "armv7h" "aarch64")
url="http://melonds.kuribo64.net/"
license=("GPL-3.0-or-later")
makedepends=("wayland" "git" "cmake" "pkg-config" "extra-cmake-modules" "clang")
depends=("qt6-base" "qt6-multimedia" "qt6-svg" "sdl2" "enet" "libx11" "libglvnd" "hicolor-icon-theme")
source=("$pkgname::git+https://github.com/melonDS-emu/melonDS.git#tag=${pkgver}")
sha256sums=('414b376e14a66d8e095605b83a6b7711c04330be159b2649c87213fe8af0c9c6')

prepare() {
  cd $pkgname
}

build() {
  # With gcc 15.1.1 it fails to compile with an internal compiler error during linking
  export CC="clang"
  export CXX="clang++"

  cmake -B build -S $pkgname \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  
  cmake --build build
}

package() {
  cd "$srcdir"
  
  DESTDIR="$pkgdir" cmake --install build
}
