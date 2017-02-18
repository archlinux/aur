# Maintainer: Tomasz Paś <kierek93@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-melonds-git
_gitname=melonds
pkgver=106.ebe336b
pkgrel=1
pkgdesc="libretro port of MelonDS, new Nintendo DS emulator"
arch=('i686' 'x86_64')
url="https://github.com/libretro/melonDS"
license=('GPLv2')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/melonds_libretro.info")
groups=('libretro')

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
  install -Dm644 "${srcdir}/melonds_libretro.info" "${pkgdir}/usr/share/libretro/info/melonds_libretro.info"
  install -Dm644 "${_gitname}/melonds_libretro.so" "${pkgdir}/usr/lib/libretro/melonds_libretro.so"
}
