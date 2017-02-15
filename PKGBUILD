# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame2016-git
pkgver=44390.e976a28b35
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="Late 2016 version of MAME (0.174) for libretro. Compatible with MAME 0.174 romsets. (Arcade)"
url="https://github.com/libretro/mame2016-libretro"
license=('custom:MAME License')
groups=('libretro')
makedepends=('git' 'python2')

_libname=mame2016_libretro
_gitname=mame2016-libretro
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
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
  install -Dm644 "${_gitname}/docs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
