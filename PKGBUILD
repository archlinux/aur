# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-neocd-git
pkgver=80.b795a80
pkgrel=1
pkgdesc="Neo Geo CD emulator for libretro"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/neocd_libretro"
license=('LGPL3')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info' 'flac' 'libogg' 'libvorbis' 'zlib')
makedepends=('git' 'cmake')

_libname=neocd_libretro
_gitname=neocd_libretro
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
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  msg2 "\e[1;32mneocd requires a bunch of BIOS files placed in the libretro 'system' folder. \e[0m"
  msg2 "\e[1;32mPlease have a look at https://github.com/libretro/neocd_libretro how to accomplish this. \e[0m"
}
