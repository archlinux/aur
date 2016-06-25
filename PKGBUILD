# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mednafen-ngp-git
pkgver=722.0213ef4
pkgrel=1
pkgdesc="libretro implementation of Mednafen NGP, itself a fork of Neopop (Neo Geo Pocket/Color)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-ngp-libretro"
license=('GPL2')
makedepends=('git')

_libname=mednafen_ngp_libretro
_gitname=beetle-ngp-libretro

source=("git+https://github.com/libretro/beetle-ngp-libretro.git"       
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mednafen_ngp_libretro.info")
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
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
