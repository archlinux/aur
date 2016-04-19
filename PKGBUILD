# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-81-libretro-git
pkgver=101.2fbe08a
pkgrel=1
pkgdesc="A port of the EightyOne ZX81 Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/81-libretro.git"
license=('GPL3')
depends=('zlib')
makedepends=('git')

_libname=81_libretro
_gitname=81-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha256sums=('SKIP'
	'SKIP')

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
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
