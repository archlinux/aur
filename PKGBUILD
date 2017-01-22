# Maintainer : Thomas Kreuzer <thomas dot kreuzer at rwth-aachen dot de>

pkgname=libretro-glupen64-git
pkgver=359.b42c669
pkgrel=1
pkgdesc="mupen64plus + GlideN64 + libretro"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/loganmc10/GLupeN64"
license=('GPLv3')
makedepends=('git')

_libname=glupen64_libretro
_gitname=GLupeN64
source=("git+https://github.com/loganmc10/${_gitname}.git"
        "https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/${_libname}.info")
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
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}
