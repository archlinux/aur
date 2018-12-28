# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-cannonball-git
pkgver=339.b687c7f
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro version of Cannonball - An Enhanced OutRun Engine"
url="https://github.com/libretro/cannonball"
license=('custom')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info' 'cmake' 'mesa' 'sdl')
makedepends=('git' 'boost-libs')

_libname=cannonball_libretro
_gitname=cannonball
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/${_libname}.info")
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
  install -Dm644 ""${_gitname}"/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
  msg2 "\e[1;32mPlease have a look at https://github.com/djyt/cannonball/blob/master/roms/roms.txt"
  msg2 "\e[1;32mto find out which roms are needed."
  msg2 "\e[1;32mAlso, create a file 'outrun.game' somewhere (ie in your roms directory) and"
  msg2 "\e[1;32mname that file as a parameter to retroarch (see corresponding .info file also). \e[0m"
}
