# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-virtualjaguar-git
pkgver=162.4f92ba6
pkgrel=1
pkgdesc="libretro implementation of Virtual Jaguar. (Atari Jaguar)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/virtualjaguar-libretro"
license=('GPL3')
groups=('libretro')
makedepends=('git')

_libname=virtualjaguar_libretro
_gitname=virtualjaguar-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha256sums=('SKIP'
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
