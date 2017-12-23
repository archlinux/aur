# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-nekop2-git
pkgver=86.ed1c527
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="Neko Project 2 (PC98 emulator) port for libretro/RetroArch"
url="https://github.com/libretro/libretro-meowPC98"
license=('GPL2')
groups=('libretro')
makedepends=('git' 'python2')

_libname=nekop2_libretro
_gitname=libretro-meowPC98
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/libretro"
  make -f Makefile
}

package() {
  install -Dm644 "${_gitname}/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
