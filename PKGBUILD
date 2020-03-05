# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame2016-git
pkgver=44421.02987af9b8
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="Late 2016 version of MAME (0.174) for libretro. Compatible with MAME 0.174 romsets. (Arcade)"
url="https://github.com/libretro/mame2016-libretro"
license=('custom:MAME License')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git' 'python2')

_libname=mame2016_libretro
_gitname=mame2016-libretro
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
  install -Dm644 "${_gitname}/docs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
