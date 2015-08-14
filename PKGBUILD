# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-nxengine-git
pkgver=389.dc2545f
pkgrel=1
pkgdesc="libretro implementation of NXEngine. (Cave Story)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
#maybe any will be good in the future
url="https://github.com/libretro/nxengine-libretro"
license=('GPL3')
makedepends=('git')

install=libretro-nxengine.install

_libname=nxengine_libretro
_gitname=nxengine-libretro
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/${_libname}.info"
        "http://www.cavestory.org/downloads/cavestoryen.zip")
md5sums=('SKIP'
         'SKIP'
         '5aad47f1cb72185d6e7f4c8c392f6b6e')

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

  install -Dm644 "CaveStory/Doukutsu.exe" "${pkgdir}/usr/share/libretro/${_libname}/datafiles/Doukutsu.exe"
  cp -r "CaveStory/data/" "${pkgdir}/usr/share/libretro/${_libname}/datafiles/"
}
