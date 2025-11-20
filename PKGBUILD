# Past Maintainer: Corwin <corwin@kuiper.dev>
# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
# Maintainer: Harrison <htv04rules at gmail dot com>

pkgname=melonds
pkgver=1.1
pkgrel=2
pkgdesc="DS emulator, sorta"
arch=("x86_64" "i686" "pentium4" "armv7h" "aarch64")
url="http://melonds.kuribo64.net/"
license=("GPL-3.0-or-later")
makedepends=("wayland" "git" "cmake" "pkg-config" "extra-cmake-modules" "clang")
depends=("qt6-base" "qt6-multimedia" "qt6-svg" "sdl2" "enet" "libx11" "libglvnd" "hicolor-icon-theme" "faad2")
source=("$pkgname::git+https://github.com/melonDS-emu/melonDS.git#tag=${pkgver}")
sha256sums=('f40db55b2a58173e1829a27e2f49c68440115eebcd48ed19a5d45d6bfa4bc717')

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
