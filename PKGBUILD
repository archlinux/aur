# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-hatari-git
pkgver=5546.46dc6d95
pkgrel=1
pkgdesc="libretro implementation of Hatari v1.8 (Atari ST/STE/TT/Falcon)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/hatari"
license=('GPL2')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=hatari_libretro
_gitname=hatari
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${_gitname}
  make -f Makefile.libretro EXTERNAL_ZLIB=1
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
