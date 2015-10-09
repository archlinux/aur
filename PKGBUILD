# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame-git
pkgver=38935.e94b80b

pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of MAME 2015. (Arcade)"
url="https://github.com/libretro/mame"
license=('custom:MAME License')
makedepends=('git' 'python2')

_libname=mame_libretro
_gitname=mame
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
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
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
  install -Dm644 "${_gitname}/docs/mamelicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
