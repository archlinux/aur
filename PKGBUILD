# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-snes9x2010-git
pkgver=829.ac2c080
pkgrel=1
pkgdesc="libretro implementation of Snes9x Next. (Super Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/snes9x2010"
license=('custom')
makedepends=('git')

_libname=snes9x2010_libretro
_gitname=snes9x2010
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'f21f6154247bda5eae3bb8f4438e86b2')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/docs/snes9x-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}
