# Maintainer:  TwoLeaves < ohneherren at gmail dot com >

pkgname=libretro-mame2010-git
pkgver=116.a4537c3

pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of MAME 2010. (Arcade)"
url="https://github.com/libretro/mame2010-libretro"
license=('custom:MAME License')
makedepends=('git' 'python2')

_libname=mame2010_libretro
_gitname=mame2010-libretro
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
  export PTR64=1
  make -f Makefile "VRENDER=soft" -j4 buildtools PTR64=1
  make -f Makefile "VRENDER=soft" -j4 PTR64=1
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
  install -Dm644 "${_gitname}/docs/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
