# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame2003-git
pkgver=1019.0780653
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of late 2003 version of MAME (0.78) (Arcade)"
url="https://github.com/libretro/mame2003-libretro"
license=('custom:MAME License')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git' 'python2')

_libname=mame2003_libretro
_gitname=mame2003-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/mame/master/docs/LICENSE")
sha256sums=('SKIP'
	'SKIP')

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
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
