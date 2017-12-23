# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-ppsspp-git
pkgver=23325.dd73f9110
pkgrel=2
pkgdesc="libretro implementation of PPSSPP (PlayStation Portable/PSP)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/ppsspp"
license=('GPL')
groups=('libretro')
depends=('zlib' 'libgl')
makedepends=('git')

_libname=ppsspp_libretro
_gitname=ppsspp
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_gitname}"
  git submodule update --init --recursive
}

build() {
  cd "${_gitname}/libretro"
  make
}

package() {
  install -Dm644 "${_gitname}/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
