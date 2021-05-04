# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=libretro-catsfc-git
pkgver=714.21df2ce
pkgrel=1
pkgdesc="libretro implementation of CATSFC. (Super Nintendo Entertainment System)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
groups=('libretro')
url="https://github.com/libretro/CATSFC-libretro"
license=('custom')
makedepends=('git')
depends=('libretro-core-info')

_libname=snes9x2005_libretro
_gitname=CATSFC-libretro
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

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
  install -Dm644 "${_gitname}/copyright" "${pkgdir}/usr/share/licenses/$pkgname/license.txt"
}
