# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-fbalpha-git
pkgver=6560.98708751c
pkgrel=1
pkgdesc="libretro implementation of Final Burn Alpha (v0.2.97.42) (Arcade)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/fbalpha"
license=('custom:Non-commercial')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git')

_libname=fbalpha_libretro
_gitname=fbalpha
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
#  obosolete?
#  RPI=`grep -m1 'Revision' /proc/cpuinfo | awk '{print $3}'`
#  case "${RPI}" in
#    a[0-2]1041)	PLATFORM="platform=rpi2" ;;
#    a[0-2]2082)	PLATFORM="platform=rpi3" ;;
#  esac
#  cd "${_gitname}"
#  make -f makefile.libretro ${PLATFORM}
  cd "${_gitname}"
  make -f makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/src/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
