# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-desmume-git
pkgver=r5267.a5a4e9b
pkgrel=1
pkgdesc="libretro implementation of DeSmuME. (Nintendo DS)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/desmume"
license=('GPL')
makedepends=('git')
_libname=desmume_libretro
_gitname=desmume
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {

  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  cd "${_gitname}/desmume"
  make -f Makefile.libretro

}

package() {

  install -Dm644 "${_gitname}/desmume/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
