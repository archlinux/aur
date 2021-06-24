# Maintainer:  Oliver Jaksch <arch-aur at com-in dot de>
# Contributor: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-beetle-vb-git
pkgver=817.efa6475
pkgrel=1
pkgdesc="Virtual Boy emu - Standalone port of Beetle / Mednafen VB to libretro."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-vb-libretro"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
replaces=('libretro-mednafen-vb-git')

_libname=mednafen_vb_libretro
_gitname=beetle-vb-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

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
}
