# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame2015-git
pkgver=35245.2c1c121842
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="Late 2014/Early 2015 version of MAME (0.160-ish) for libretro. Compatible with MAME 0.160 romsets (Arcade)"
url="https://github.com/libretro/mame2015-libretro"
license=('custom:MAME License')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git' 'python2')

_libname=mame2015_libretro
_gitname=mame2015-libretro
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
  install -Dm644 "${_gitname}/docs/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
