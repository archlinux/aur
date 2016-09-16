# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-frodo-git
pkgver=154.d085442
pkgrel=3
pkgdesc="libretro implementation of Frodo v4.2 (Commodore C64) (WIP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/r-type/frodo-libretro"
license=('GPL2')
groups=('libretro')
depends=('zlib')
makedepends=('git' 'gcc5')

_libname=frodo_libretro
_gitname=frodo-libretro
source=("git+https://github.com/r-type/${_gitname}.git"
	"${_libname}.info"
	'gcc5.patch')
sha256sums=('SKIP'
	    'SKIP'
	    '852e17c6e23debadc8b87098d5bdd10dc688d2bc43d7cdbf029b3c5661ab4aea')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  patch < ${srcdir}/gcc5.patch
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
