# Maintainer: Cecile Tonglet <cecile.tonglet@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: prettyvanilla <prettyvanilla@posteo.at>
# Contributor: almostalive   <almostalive2003 at gmail dot com>

pkgname=libretro-pcsx-rearmed-git
pkgver=1358.c6e7ce9
pkgrel=1
pkgdesc="libretro implementation of PCSX ReARMed. (PlayStation)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/pcsx_rearmed"
license=('GPL')
conflicts=('libretro-pcsx_rearmed-git')
depends=('zlib' 'libretro-core-info')
makedepends=('git')
groups=('libretro')

_libname=pcsx_rearmed_libretro
_gitname=pcsx_rearmed
source=("git+https://github.com/libretro/${_gitname}.git")

md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  # detect Raspberry Pi 2 and 3
  grep -q 'Hardware.\+BCM2835' /proc/cpuinfo && export platform=rpi2
  make -f Makefile.libretro
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
