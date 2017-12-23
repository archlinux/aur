# Maintainer : Johnathan Jenkins <twodopeshaggy@gmail.com>
# Contributor:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-genesis-plus-gx-git
pkgver=1366.5c515fb
pkgrel=1
pkgdesc="libretro implementation of Genesis Plus GX. (Sega Master System/Sega Game Gear/Sega Mega Drive/Sega Genesis/Sega CD)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
groups=('libretro')
url="https://github.com/libretro/Genesis-Plus-GX"
license=('custom')
conflicts=('libretro-genplus-git')
depends=('zlib' 'libretro-core-info')
makedepends=('git')

_libname=genesis_plus_gx_libretro
_gitname=Genesis-Plus-GX
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
