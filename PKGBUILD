# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-pcsx-rearmed-git
pkgver=1137.33b8211
pkgrel=1
pkgdesc="libretro implementation of PCSX ReARMed. (PlayStation)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/pcsx_rearmed"
license=('GPL')
conflicts=('libretro-pcsx_rearmed-git')
depends=('zlib')
makedepends=('git')

_libname=pcsx_rearmed_libretro
_gitname=pcsx_rearmed
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
}
