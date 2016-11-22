# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor:  Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-prboom-git
pkgver=157.2bfa6c7
pkgrel=1
pkgdesc="libretro implementation of PrBoom. (Doom)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/libretro-prboom"
license=('GPL')
makedepends=('git')

install=libretro-prboom.install

_libname=prboom_libretro
_gitname=libretro-prboom
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
  make
}

package() {
  install -Dm644 "${_gitname}/prboom.wad" "${pkgdir}/usr/share/libretro/${_libname}/prboom.wad"
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}
