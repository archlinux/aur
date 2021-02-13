# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-2048-git
pkgver=204.1846c73
pkgrel=1
pkgdesc="libretro implementation of 2048"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-2048"
license=('GPL' 'LGPL')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git')

_gitname=libretro-2048
_libname=2048_libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

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
}
