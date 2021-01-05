# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-freeintv-git
pkgver=167.cd2f009
pkgrel=1
pkgdesc="A libretro emulation core for the Mattel Intellivision designed to be compatible with joypads from the SNES era forward"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/FreeIntv"
license=('custom:zlib')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=freeintv_libretro
_gitname=FreeIntv
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  msg2 "\e[1;32mFreeIntv requires Intellivision BIOS files 'exec.bin' and 'grom.bin' to be placed in the libretro 'system' folder. \e[0m"
}
