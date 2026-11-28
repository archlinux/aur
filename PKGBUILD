# PKGBUILD forked from https://aur.archlinux.org/packages/z80dasm by:
# Maintainer: Peter Ivanov <ivanovp@gmail.com>

# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=z80dasm
pkgname=z80dasm-git
pkgver=1.2.0
pkgrel=1
pkgdesc="Disassembler for the Zilog Z80 microprocessor"
arch=('i686' 'x86_64')
url="https://github.com/lvitals/z80dasm"
license=('GPL2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('glibc')
makedepends=('git' 'cmake' 'ninja')
source=("git+$url")
b2sums=('SKIP')

build() {
  cmake \
    -B build \
    -S "${_pkgname}" \
    -D CMAKE_BUILD_TYPE=Release -GNinja \
    -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 $_pkgname/COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}
# vim:et:
