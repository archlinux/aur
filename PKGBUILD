# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-fbneo-git
pkgver=7068.352ed6ea
pkgrel=1
pkgdesc="libretro FBNeo NEW implementation of Final Burn Alpha"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/FBNeo"
license=('custom:Non-commercial')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')
replaces=('libretro-fbalpha-git')

_libname=fbneo_libretro
_gitname=FBNeo
source=("git+https://github.com/libretro/${_gitname}.git"
	"cpu.patch")
sha256sums=('SKIP'
	'b5c126a69485f80e49c596f7ea1275823f7cc50e0f60d2dadf7cda6a248bd11d')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  patch -p0 < ../cpu.patch
  make sdl
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/src/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
