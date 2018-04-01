# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mesen-git
pkgver=1866.d9629e67
pkgrel=2
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="Mesen is a cross-platform (Windows & Linux) NES/Famicom emulator built in C++ and C#"
url="https://github.com/libretro/Mesen"
license=('GPL3')
groups=('libretro')
depends=('zlib' 'glibc')
makedepends=('git' 'clang')

_libname=mesen_libretro
_gitname=mesen
source=("git+https://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/mesen_libretro.info")
sha256sums=('SKIP'
	'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make -j4 -f makefile libretro
}

package() {
  install -Dm644 "${_gitname}/Libretro/obj.x64/${_libname}.x64.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
