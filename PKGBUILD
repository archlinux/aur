# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame2014-git
pkgver=35192.790dca5a1e
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of late 2014/early 2015 version of MAME (0.159-ish) (Arcade)"
url="https://github.com/libretro/mame2014-libretro"
license=('custom:MAME License')
groups=('libretro')
makedepends=('git' 'python2')

_libname=mame2014_libretro
_gitname=mame2014
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
  make -f Makefile
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
  install -Dm644 "${_gitname}/docs/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
