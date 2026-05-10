# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Doommsatic <keniscoolu@gmail.com>

pkgname=nba
pkgver=1.8.3
pkgrel=1
pkgdesc="highly accurate Nintendo Game Boy Advance emulator"
arch=('x86_64')
url="https://github.com/nba-emu/NanoBoyAdvance"
license=('GPL')
depends=('glew' 'libunarr' 'qt6-base' 'sdl2')
makedepends=('cmake' 'git' 'glad')
source=($pkgname::git+https://github.com/nba-emu/NanoBoyAdvance.git#tag=v${pkgver})
sha256sums=('4c13be0818ff300767eb9fd1d4d8e2252667fde4560a223d07014339053f6051')


build() {
  local cmake_options=(
    -B build
    -S $pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  # Simple install
  #install -Dm755 build/bin/qt/None/NanoBoyAdvance "${pkgdir}/usr/bin/nba"

  # The theoretically better one
  DESTDIR=${pkgdir} cmake --install build

  # Remove unwanted stuff
  rm -r ${pkgdir}/usr/{include,lib}

  # Symbolic link to nba for old times sake
  cd ${pkgdir}/usr/bin/
  ln -s NanoBoyAdvance nba
}
