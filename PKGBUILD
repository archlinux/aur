# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-vecx-git
pkgver=79.4735946
pkgrel=1
pkgdesc="libretro implementation of vecx (Vectrex)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-vecx"
license=('GPL2')
groups=('libretro')
makedepends=('git')

_libname=vecx_libretro
_gitname=libretro-vecx

source=("git+https://github.com/libretro/libretro-vecx.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/vecx_libretro.info")
sha256sums=('SKIP'
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
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/share/libretro/info/${_libname}.info"
}
