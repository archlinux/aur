# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-dosbox-git
pkgver=284.9590645
pkgrel=2
pkgdesc="libretro implementation of DOSBox."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/dosbox-libretro"
license=('GPL')
groups=('libretro')
makedepends=('git')

_libname=dosbox_libretro
_gitname=dosbox-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
