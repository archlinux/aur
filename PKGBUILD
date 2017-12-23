# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-hatari-git
pkgver=5436.c19b7105
pkgrel=2
pkgdesc="libretro implementation of Hatari v1.8 (Atari ST/STE/TT/Falcon)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/hatari"
license=('GPL2')
groups=('libretro')
depends=('zlib')
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
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
