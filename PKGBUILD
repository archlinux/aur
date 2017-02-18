# Maintainer: Tomasz Paś <kierek93@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-n64-git
_gitname=parallel-n64
pkgver=4440.9333709c
pkgrel=1
pkgdesc="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."
arch=('i686' 'x86_64')
url="https://github.com/libretro/parallel-n64"
license=('custom' 'GPL' 'LGPL')
makedepends=('git' 'vulkan-headers')
depends=('libglvnd' 'vulkan-icd-loader' 'clang')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/parallel_n64_libretro.info")
groups=('libretro')

md5sums=('SKIP'
	 'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  if [ $CARCH == "i686" ];then
   make WITH_DYNAREC=x86
  else
   make WITH_DYNAREC=$CARCH
  fi
}

package() {
  install -Dm644 "${srcdir}/parallel_n64_libretro.info" "${pkgdir}/usr/share/libretro/info/parallel_n64_libretro.info"
  install -Dm644 "${_gitname}/parallel_n64_libretro.so" "${pkgdir}/usr/lib/libretro/parallel_n64_libretro.so"
}
