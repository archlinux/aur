#AUR3 Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
#AUR4 Maintainer:  firstbass	<brettrsears@gmail.com>
pkgname=libretro-3dengine-git
pkgver=89.0a29852
pkgrel=1
pkgdesc="3D Engine for libretro GL."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-3dengine"
license=('unknown')
depends=('zlib' 'libgl')
makedepends=('git')

_libname=3dengine_libretro
_gitname=libretro-3dengine
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
