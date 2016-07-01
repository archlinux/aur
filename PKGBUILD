# Maintainer:  Benjamin Hodgetts <ben@xnode.org>

_libname=bluemsx_libretro
_gitname=blueMSX-libretro

pkgname=libretro-bluemsx-git
pkgver=108.452bb49
pkgrel=1
pkgdesc="Libretro implementation of BlueMSX (Microsoft MSX)."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/blueMSX-libretro"
license=('BSD')
depends=('zlib')
makedepends=('git')
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  mv Makefile.libretro Makefile
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
