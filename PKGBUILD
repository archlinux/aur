# Maintainer: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-gpsp-git
_gitname=gpsp
pkgver=298
pkgrel=1
pkgdesc="libretro implementation of gpsp"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
groups=('libretro')
url="https://github.com/libretro/gpsp"
license=('custom' 'GPL' 'LGPL')
makedepends=('git')

source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/gpsp_libretro.info")
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
  install -Dm644 "${srcdir}/gpsp_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-gpsp.info"
  install -Dm644 "${_gitname}/gpsp_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-gpsp.so"
}
