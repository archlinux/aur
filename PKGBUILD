# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-fuse-git
pkgver=140.125eae0
pkgrel=1
pkgdesc="A port of the Fuse Unix Spectrum Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/fuse-libretro.git"
license=('GPL3')
depends=('zlib')
makedepends=('git')

_libname=fuse_libretro
_gitname=fuse-libretro
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
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
