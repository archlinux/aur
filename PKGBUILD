# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-gw-git
pkgver=272.e3ba6eb
pkgrel=1
pkgdesc="gw-libretro is a libretro core that runs Game & Watch simulators"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/gw-libretro"
license=('custom:zlib')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=gw_libretro
_gitname=gw-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

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
  install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
