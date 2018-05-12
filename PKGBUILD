# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-thepowdertoy-git
pkgver=45.a619961
pkgrel=1
pkgdesc="A port of The Powder Toy to libretro."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/ThePowderToy"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs')
makedepends=('git' 'cmake')

_libname=thepowdertoy_libretro
_gitname=ThePowderToy
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  mkdir build && cd build
  cmake ..
  make -j4
}

package() {
  install -Dm644 "${_gitname}/build/src/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}

