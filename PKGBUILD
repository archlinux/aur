# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-cap32-git
pkgver=73.74e8279
pkgrel=1
pkgdesc="libretro implementation of Caprice32 (Amstrad CPC)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-cap32"
license=('GPL')
makedepends=('git')

_libname=cap32_libretro
_gitname=libretro-cap32

source=("git+https://github.com/libretro/libretro-cap32.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/cap32_libretro.info")
sha256sums=('SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}