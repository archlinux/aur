# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-gw-git
pkgver=175.7cafbf4
pkgrel=1
pkgdesc="gw-libretro is a libretro core that runs Game & Watch simulators"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/gw-libretro"
license=('custom:zlib')
groups=('libretro')
depends=('zlib')
makedepends=('git')

_libname=gw_libretro
_gitname=gw-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
sha256sums=('SKIP'
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
  install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
