# Maintainer: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-2048-git
_gitname=libretro-2048
pkgver=70
pkgrel=1
pkgdesc="libretro implementation of 2048"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-2048"
license=('custom' 'GPL' 'LGPL')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/2048_libretro.info")

md5sums=('SKIP'
	 'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${srcdir}/2048_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-2048.info"
  install -Dm644 "${_gitname}/2048_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-2048.so"
}
