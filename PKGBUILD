# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mednafen-wswan-git
pkgver=703.93459f9
pkgrel=1
pkgdesc="libretro implementation of Mednafen WonderSwan to libretro, itself a fork of Cygne."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-wswan-libretro"
license=('GPL2')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=mednafen_wswan_libretro
_gitname=beetle-wswan-libretro

source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
