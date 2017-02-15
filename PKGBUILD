# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame2000-git
pkgver=121.1083de2
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of 2000 version of MAME (0.37b5) (Arcade)"
url="https://github.com/libretro/mame2000-libretro"
license=('custom:MAME License')
groups=('libretro')
makedepends=('git' 'python2')

_libname=mame2000_libretro
_gitname=mame2000-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info"
	"https://raw.githubusercontent.com/libretro/mame/master/docs/LICENSE")
sha256sums=('SKIP'
	'SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  [[ "${CARCH}" == *"arm"* ]] && ARM="ARM=1"
  make -f Makefile ${ARM}
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
