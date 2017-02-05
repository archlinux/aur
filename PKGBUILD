# Maintainer: Tomasz Paś <kierek93@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-mednafen-saturn-git
_gitname=beetle-saturn-libretro
pkgver=131.63af0ea
pkgrel=1
pkgdesc="libretro port of Mednafen Saturn"
arch=('x86_64')
url="https://github.com/libretro/beetle-saturn-libretro"
license=('GPLv2')
makedepends=('git')
depends=('libglvnd' 'clang')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mednafen_saturn_libretro.info")
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
  install -Dm644 "${srcdir}/mednafen_saturn_libretro.info" "${pkgdir}/usr/share/libretro/info/mednafen_saturn_libretro.info"
  install -Dm644 "${_gitname}/mednafen_saturn_libretro.so" "${pkgdir}/usr/lib/libretro/mednafen_saturn_libretro.so"
}
