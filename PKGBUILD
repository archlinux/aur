# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mrboom-git
pkgver=64.adcc8c2
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="Mr.Boom is a 8 players Bomberman clone for RetroArch/Libretro"
url="https://github.com/libretro/mrboom-libretro"
license=('MIT')
groups=('libretro')
makedepends=('git' 'python2' 'sdl2_mixer')

_libname=mrboom_libretro
_gitname=mrboom-libretro
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
  install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
