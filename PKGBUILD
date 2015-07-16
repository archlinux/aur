# AUR3 Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# AUR4 Maintainer: firstbass	<brettrsears@gmail.com>
# Contributor: almostalive   <almostalive2003 at gmail dot com>
# Contributor: Themaister    <maister@archlinux.us>

pkgname=dinothawr
pkgver=409.b6a4503
pkgrel=1
pkgdesc="Block pushing puzzle game on slippery surfaces. Free your dinosaur friends from their ice prison. Needs a libretro frontend to play."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/Dinothawr"
license=('custom')
depends=('zlib')
makedepends=('git')

install=dinothawr.install

_gitname=Dinothawr
source=("git+https://github.com/libretro/${_gitname}.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/dinothawr_libretro.info")
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
  install -Dm644 "${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 "${_gitname}/dinothawr_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-dinothawr.so"
  install -Dm644 "dinothawr_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-dinothawr.info"
  install -Dm644 "${_gitname}/dinothawr/dinothawr.game" "${pkgdir}/usr/share/libretro/libretro-dinothawr/dinothawr/dinothawr.game"
  cp -r "${_gitname}/dinothawr/" "${pkgdir}/usr/share/libretro/libretro-dinothawr/"
}
