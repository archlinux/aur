# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>

pkgname=melonds-git
_gitname=melonDS
pkgver=0.9.5.r2238.082310d5
pkgdesc='DS emulator, sorta. also 1st quality melon.'
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://melonds.kuribo64.net/"
license=('GPL-3.0-or-later')
makedepends=('git' 'cmake' 'pkg-config' 'extra-cmake-modules')
depends=('sdl2' 'libslirp' 'qt5-base' 'qt5-multimedia' 'libepoxy')
source=("${_gitname}::git+https://github.com/melonDS-emu/${_gitname}.git")
provides=('melonds')
conflicts=('melonds')

md5sums=('SKIP')

pkgver()
{
  cd "${_gitname}"
  printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  local _cmake_options=(
    -B build
    -S "$_gitname"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DVERBOSE=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package()
{
  DESTDIR="${pkgdir:?}" cmake --install build
}

# vim: ts=2 sw=2 et:
