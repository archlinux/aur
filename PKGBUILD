# Maintainer:  Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-openlara-git
pkgver=647.66a959c
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of Classic Tomb Raider open-source engine"
url="https://github.com/libretro/OpenLara"
license=('2-Clause BSD')
groups=('libretro')
depends=('libglvnd' 'libpulse')
makedepends=('git')

_libname=openlara_libretro
_gitname=OpenLara
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -C src/platform/libretro
}

package() {
  install -Dm644 "${_gitname}/src/platform/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  mkdir -p "${pkgdir}/usr/share/libretro/${_libname}"
  cp -a "${_gitname}/bin/" "${pkgdir}/usr/share/libretro/${_libname}"
}

