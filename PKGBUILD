# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-4do-git
pkgver=138.6417f68
pkgrel=1
pkgdesc="libretro implementation of 4DO/libfreedo (3DO)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/4do-libretro"
license=('GPL3')
groups=('libretro')
depends=('zlib')
makedepends=('git')

_libname=4do_libretro
_gitname=4do-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}
