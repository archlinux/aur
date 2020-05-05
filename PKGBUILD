# Maintainer: quellen <lodgerz@gmail.com>

pkgname=libretro-vice-git
pkgver=19959.fd9e2198f
pkgrel=1
pkgdesc="A port of the C64 Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/vice-libretro"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'libretro-core-info')
makedepends=('git')

_libname=vice_x64_libretro
_gitname=vice-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make clean EMUTYPE=x64
  make                
}


package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}