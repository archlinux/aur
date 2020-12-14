# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-vecx-git
pkgver=163.f38e65f
pkgrel=1
pkgdesc="libretro implementation of vecx (Vectrex)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-vecx"
license=('GPL2')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=vecx_libretro
_gitname=libretro-vecx

source=("git+https://github.com/libretro/libretro-vecx.git")
sha256sums=('SKIP')

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
}
