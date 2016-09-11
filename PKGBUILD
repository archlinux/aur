# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>
# Former Maintainer : Lauri Niskanen <ape@ape3000.com>

pkgname=libretro-gambatte-git
pkgver=r618.d5af1d7
pkgrel=1
pkgdesc="libretro implementation of libgambatte. (Game Boy Color)"
arch=('i686' 'x86_64' 'arm' 'armv6h')
url="git@github.com:libretro/gambatte-libretro.git"
license=('GPLv2')
makedepends=('git')
_libname=gambatte_libretro
_gitname=gambatte-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info")
md5sums=('SKIP'
         'SKIP')

pkgver() {

  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  cd "${_gitname}"
  make -f Makefile.libretro

}

package() {

  install -Dm644 "${srcdir}/${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_libname}.info" "${pkgdir}/usr/lib/libretro/${_libname}.info"

}
