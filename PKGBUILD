# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-altirrasdl-git
pkgver=r537.1adbf587
pkgrel=1
pkgdesc="libretro implementation of AltirraSDL"
arch=('x86_64' 'aarch64')
url="https://github.com/ilmenit/AltirraSDL"
license=('GPL2')
depends=('cmake' 'sdl3' 'sdl3_image' 'libretro-core-info')
optdepends=('librashader')
makedepends=('git')
source=("git+https://github.com/ilmenit/AltirraSDL.git")
sha256sums=('SKIP')
_libname=altirra_libretro
_librealname=altirrasdl_libretro

pkgver() {
  cd "AltirraSDL"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "AltirraSDL"
  make -f Makefile.libretro
}

package() {
  cd "AltirraSDL"
  install -Dm644 "./build/libretro-make/src/AltirraLibretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_librealname}.so"
  install -Dm644 "./build/libretro-make/src/AltirraLibretro/${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_librealname}.info"
}
