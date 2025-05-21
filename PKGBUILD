# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Doommsatic <keniscoolu@gmail.com>

pkgname=nba
pkgver=1.8.2
pkgrel=2
pkgdesc="highly accurate Nintendo Game Boy Advance emulator"
arch=('x86_64')
url="https://github.com/nba-emu/NanoBoyAdvance"
license=('GPL')
depends=('glew' 'libunarr' 'qt6-base' 'sdl2')
makedepends=('cmake' 'git' 'glad')
source=($pkgname::git+https://github.com/nba-emu/NanoBoyAdvance.git#tag=v${pkgver})
sha256sums=('c220a0229d8f9a77c6bf959037c13138336f20234505e41562c4fec6342e0c28')


build() {
  local cmake_options=(
    -B build
    -S $pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D USE_QT6='ON'
    -D USE_SYSTEM_UNARR='ON'
    -D USE_SYSTEM_TOML11='OFF'
    -D USE_SYSTEM_FMT='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 build/bin/qt/NanoBoyAdvance "${pkgdir}/usr/bin/nba"
}
