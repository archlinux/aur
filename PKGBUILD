# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-fceumm-git
pkgver=89.4ec659e
pkgrel=1
pkgdesc="libretro implementation of FCEUmm. (Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/libretro-fceumm"
license=('GPL')
makedepends=('git')

_libname=fceumm_libretro
_gitname=libretro-fceumm
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
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}
