# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-81-git
pkgver=160.7d769d0
pkgrel=1
pkgdesc="A port of the EightyOne ZX81 Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/81-libretro.git"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=81_libretro
_gitname=81-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
