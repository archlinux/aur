# Maintainer: quellen <lodgerz@gmail.com>

pkgname=libretro-fsuae-git
pkgver=1712.7990f7ad
pkgrel=1
pkgdesc="A port of the Commodore Amiga Emulator to libretro (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-fsuae"
license=('GPL3')
groups=('libretro')
depends=('zlib')
makedepends=('git')

_libname=fsuae_libretro
_gitname=libretro-fsuae
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
  ./autogen.sh
  ./configure
  make gen -j 4
  make clean
  make -j 4
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}