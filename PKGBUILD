# Maintainer: Tomasz Paś <kierek93@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-git
_gitname=mupen64plus-libretro
pkgver=4409.d40e5f88
pkgrel=1
pkgdesc="Mupen64plus with dynarec and vulkan powered rdp lle"
arch=('i686' 'x86_64')
url="https://github.com/libretro/mupen64plus-libretro"
license=('custom' 'GPL' 'LGPL')
makedepends=('git' 'vulkan-headers' 'llvm')
depends=('libglvnd' 'vulkan-icd-loader' 'clang')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git"
	"https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/parallel_libretro.info")
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
   make WITH_DYNAREC=x86 HAVE_PARALLEL_ONLY=1
  else
   make WITH_DYNAREC=$CARCH HAVE_PARALLEL_ONLY=1
  fi
}

package() {
  install -Dm644 "${srcdir}/parallel_libretro.info" "${pkgdir}/usr/share/libretro/info/parallel_libretro.info"
  install -Dm644 "${_gitname}/parallel_libretro.so" "${pkgdir}/usr/lib/libretro/parallel_libretro.so"
}
