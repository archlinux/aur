# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-craft-git
pkgver=1062.9d37b5e
pkgrel=1
pkgdesc="A simple Minecraft clone written in C using modern OpenGL (shaders)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/Craft"
license=('custom:Craft License')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git' 'cmake')

_libname=craft_libretro
_gitname=Craft
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  # https://github.com/libretro/Craft/issues/30
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
