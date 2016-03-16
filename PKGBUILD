# Maintainer : Cecile Tonglet <cecile.tonglet@gmail.com>

pkgname=libretro-mednafen-supergrafx-git
pkgver=567.edb41ba
pkgrel=1
pkgdesc="libretro implementation of Mednafen's PCE Fast. (SuperGrafx, TG-16, PC Engine, TG-CD)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/beetle-supergrafx-libretro.git"
license=('custom')
conflicts=()
depends=('zlib')
makedepends=('git')

_libname=mednafen_supergrafx_libretro
_gitname=beetle-supergrafx-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
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
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"
}
