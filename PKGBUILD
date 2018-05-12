# Maintainer : Cecile Tonglet <cecile.tonglet@gmail.com>

pkgname=libretro-quicknes-git
pkgver=r408.6d50e29
pkgrel=1
pkgdesc="libretro implementation of QuickNES Core. (NES)"
groups=('libretro')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/QuickNES_Core.git"
license=('custom')
conflicts=()
depends=('zlib')
makedepends=('git')

_libname=quicknes_libretro
_gitname=QuickNES_Core
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
