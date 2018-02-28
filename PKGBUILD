# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-hatari2-enhanced-git
pkgver=6470.5bf52cd4
pkgrel=2
pkgdesc="libretro implementation of Hatari v2.0 (Atari ST/STE/TT/Falcon) with IPF support"
arch=('i686' 'x86_64')
url="https://github.com/r-type/hatari2"
license=('GPL2')
groups=('libretro')
depends=('capsimage' 'zlib' 'glibc' 'libretro-core-info' 'sdl2')
makedepends=('git')

_libname=hatari2_enhanced_libretro
_gitname=hatari2
source=("git+https://github.com/r-type/${_gitname}.git"
	"capsimage.patch")

sha256sums=('SKIP'
	'8f01bedd44f82c659be32904c4e729cd526ca4d5bd4f6723fb9da4b48d0add5c')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  patch < ../capsimage.patch
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/nhatari_libretro.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
