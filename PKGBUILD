# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-fbneo
pkgver=1.0.0.0
pkgrel=1
pkgdesc="libretro implementation of FinalBurn Neo"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/FBNeo"
license=('custom:Non-commercial')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')
replaces=('libretro-fbalpha-git')

_libname=fbneo_libretro
_gitname=FBNeo
source=("git+https://github.com/libretro/${_gitname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${_gitname}/src/burner/libretro"
  if [ ${CARCH:0:3} = arm ]; then params="USE_CYCLONE=1"; fi
  if [ ${CARCH} = i686 ] || [ ${CARCH} = x86_64 ]; then params="USE_X64_DRC=1"; fi
  make ${params}
}

package() {
  install -Dm644 "${_gitname}/src/burner/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/src/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
