# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-beetle-vb-git
pkgver=690.93f5b60
pkgrel=1
pkgdesc="Virtual Boy emu - Standalone port of Beetle / Mednafen VB to libretro."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-vb-libretro"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs')
makedepends=('git')

_libname=mednafen_vb_libretro
_gitname=beetle-vb-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
replaces=('libretro-mednafen-vb-git')
conflicts=('libretro-mednafen-vb-git')
md5sums=('SKIP')

pkgver() {
  	cd "${_gitname}"
  	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  	cd "${_gitname}"
  	make
}

package() {

	conflicts=('libretro-beetle-vb')
	provides=('libretro-beetle-vb')
	
  	install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}

