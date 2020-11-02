# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-hatari-enhanced-git
pkgver=5523.f19bc118
pkgrel=1
pkgdesc="libretro implementation of Hatari v1.8 (Atari ST/STE/TT/Falcon) with IPF support"
arch=('i686' 'x86_64')
url="https://github.com/libretro/hatari"
license=('GPL2')
groups=('libretro')
depends=('capsimage' 'zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=hatari_libretro
_libnewname=hatari_enhanced_libretro
_gitname=hatari
source=("git+https://github.com/libretro/${_gitname}.git"
	"capsimage.patch")

sha256sums=('SKIP'
	'473f38a4252d313bb113c377af5891b7775f826a8c6a26476fb121cc7c4b2843')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  patch < ../capsimage.patch
  make -f Makefile.libretro EXTERNAL_ZLIB=1
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libnewname}.so"
}
