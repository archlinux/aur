# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-opera-git
pkgver=425.8ce580e
pkgrel=1
pkgdesc="libretro implementation of 4DO/libfreedo (3DO)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/opera-libretro"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=opera_libretro
_gitname=opera-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

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
}
