# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-px68000-git
pkgver=215.b716d4f
pkgrel=1
pkgdesc="Portable SHARP X68000 Emulator for PSP, Android and other platforms"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/px68k-libretro"
license=('GPL3')
groups=('libretro')
depends=('zlib')
makedepends=('git')

_libname=px68k_libretro
_gitname=px68k-libretro
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
