# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-scummvm-git
pkgver=69296.d87422a
pkgrel=1
pkgdesc="libretro implementation of ScummVM."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/scummvm"
license=('GPL')
makedepends=('git')

_libname=scummvm_libretro
_gitname=scummvm
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/backends/platform/libretro/build"
  make
}

package() {
 install -Dm644 "${_gitname}/backends/platform/libretro/build/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
 install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
