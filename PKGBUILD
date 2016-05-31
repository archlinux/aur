# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-hatari-enhanced-git
pkgver=5422.2f1abde
pkgrel=1
pkgdesc="libretro implementation of Hatari v1.8 (Atari ST/STE/TT/Falcon) with IPF support"
arch=('i686' 'x86_64')
url="https://github.com/libretro/hatari"
license=('GPL2')
depends=('zlib' 'capsimage')
makedepends=('git')

_libname=hatari_libretro
_libnewname=hatari_enhanced_libretro
_gitname=hatari
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info"
	"capsimage.patch")

sha256sums=('SKIP'
	'SKIP'
	'c564cd23d6639ad146c52c6cc1767cc50b27a029a12f2e3ddfc9db1c4063f627')

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
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libnewname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libnewname}.info"
}
