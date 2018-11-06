# Maintainer:  Mike Polvere <mic.tjs@gmail.com>

pkgname=libretro-mess-git
pkgver=62246.171c1e74c5
pkgrel=1
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of MAME. (MESS Port)"
url="https://github.com/libretro/mame"
license=('custom:MAME License')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'python2')
_libname=mess_libretro
_gitname=mame
source=("git+https://github.com/libretro/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make OSD="retro" verbose=1 RETRO=1 NOWERROR=1 OS="linux" TARGETOS="linux" CONFIG="libretro" NO_USE_MIDI="1" PTR64=1 TARGET=mame SUBTARGET=mess
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/docs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
