# Maintainer: Tomasz Paś <kierek93@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-pocketcdg-git
_gitname=libretro-pocketcdg
pkgver=23.21fd39d
pkgrel=1
pkgdesc="libretro port of pocketcdg, karaoke player"
arch=('i686' 'x86_64')
url="https://github.com/libretro/libretro-pocketcdg"
license=('GPLv2')
makedepends=('git')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/pocketcdg_libretro.info")
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
  install -Dm644 "${srcdir}/pocketcdg_libretro.info" "${pkgdir}/usr/share/libretro/info/pocketcdg_libretro.info"
  install -Dm644 "${_gitname}/pocketcdg_libretro.so" "${pkgdir}/usr/lib/libretro/pocketcdg_libretro.so"
}
