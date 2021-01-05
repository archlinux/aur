# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-o2em-git
pkgver=144.dcc7b7a
pkgrel=1
pkgdesc="libretro port of O2EM, an Odyssey 2 / VideoPac emulator"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-o2em"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=o2em_libretro
_gitname=libretro-o2em
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

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
