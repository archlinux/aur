# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-frodo-git
pkgver=154.d085442
pkgrel=1
pkgdesc="libretro implementation of Frodo v4.2 (Commodore C64) (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/r-type/frodo-libretro"
license=('GPL2')
depends=('zlib')
makedepends=('git')

_libname=frodo_libretro
_gitname=frodo-libretro
source=("git+https://github.com/r-type/${_gitname}.git"
        "${_libname}.info")
sha256sums=('SKIP'
         'bc3915800b5170f100c49c0cddc9990e3e0ddb68c2e1cb4dde82caecd25b882b')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
