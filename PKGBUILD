# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-pcem-git
pkgver=149.e0e0458
pkgrel=1
pkgdesc="Libretro port of PCem, based on mooch's personal fork of PCem, based on OBattler's experimental branch"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-pcem"
license=('GPL2')
depends=('zlib' 'allegro4' 'openal' 'freealut')
makedepends=('git')

_libname=pcem_libretro
_gitname=libretro-pcem
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha256sums=('SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/src"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/src/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
