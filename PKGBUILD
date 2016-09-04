# Maintainer: Alex Eckhart <eckhartalex@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-git
_gitname=mupen64plus-libretro
pkgver=4277.61ab4e9
pkgrel=2
pkgdesc="Mupen64plus with dynarec and vulvan powered rdp lle"
arch=('i686' 'x86_64')
url="https://github.com/libretro/mupen64plus-libretro"
license=('custom' 'GPL' 'LGPL')
makedepends=('git' 'vulkan-headers')
depends=('libglvnd' 'vulkan-icd-loader' 'clang')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.github.com/libretro/libretro-super/master/dist/info/parallel_libretro.info")

md5sums=('SKIP'
	 'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  if [ $CARCH == "i686" ];then
   make WITH_DYNAREC=x86 HAVE_VULKAN=1 HAVE_PARALLEL_RSP=1
  else
   make WITH_DYNAREC=$CARCH HAVE_VULKAN=1 HAVE_PARALLEL_RSP=1
  fi
}

package() {
  install -Dm644 "${srcdir}/parallel_libretro.info" "${pkgdir}/usr/lib/libretro/libretro-parallel.info"
  install -Dm644 "${_gitname}/parallel_libretro.so" "${pkgdir}/usr/lib/libretro/libretro-parallel.so"
}
