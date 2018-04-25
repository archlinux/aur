# Maintainer:  Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>

pkgname=libretro-mame2003-plus-git
pkgver=1348.01b9094
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="Updated 2018 version of MAME (0.78) for libretro. with added game support plus many fixes and improvements"
url="https://github.com/libretro/mame2003-plus-libretro"
license=('custom:MAME License')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git' 'python2')

_libname=mame2003_plus_libretro
_gitname=mame2003-plus-libretro
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
