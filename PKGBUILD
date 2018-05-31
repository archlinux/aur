# Maintainer: spider-mario <spidermario@free.fr>
# Contributor : Michael DeGuzis <mdeguzis@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-desmume-git
pkgver=r5267.a5a4e9b
pkgrel=1
pkgdesc="libretro implementation of DeSmuME. (Nintendo DS)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/desmume"
license=('GPL')
groups=('libretro')
depends=('libglvnd')
makedepends=('git')
provides=('libretro-desmume')
conflicts=('libretro-desmume')
_libname=desmume_libretro
_gitname=desmume
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}/desmume/src/frontend/libretro"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/desmume/src/frontend/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
