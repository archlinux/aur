# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-pokemini-git
pkgver=38.218bdd5
pkgrel=1
pkgdesc="libretro implementation of Pokémon-Mini emu - Obscure nintendo handheld emulator (functional,no color files or savestates currently)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="https://github.com/libretro/PokeMini"
license=('GPL3')
groups=('libretro')
depends=('libretro-core-info')
makedepends=('git')

_libname=pokemini_libretro
_gitname=PokeMini
source=("git+https://github.com/libretro/${_gitname}.git" "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP' '7274a85498b1603a24c7dfddf0657058')

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
