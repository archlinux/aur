# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tomasz Paś <kierek93@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=libretro-parallel-n64-git
pkgver=r4975.ab155da1
pkgrel=1
pkgdesc="Optimized/rewritten Nintendo 64 emulator made specifically for Libretro. Originally based on Mupen64 Plus."
arch=('i686' 'x86_64')
url="https://github.com/libretro/parallel-n64"
license=(GPL 'custom:multiple OSI licenses')
groups=(libretro)
depends=(libglvnd vulkan-icd-loader libretro-core-info)
makedepends=(git vulkan-headers)
source=("${pkgname}::git+https://github.com/libretro/parallel-n64")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  if [ $CARCH == "i686" ];then
   make WITH_DYNAREC=x86
  else
   make WITH_DYNAREC=$CARCH
  fi
}

package() {
  cd "$pkgname"
  install -Dm644 parallel_n64_libretro.so "${pkgdir}/usr/lib/libretro/parallel_n64_libretro.so"
  install -Dm644 mupen64plus-core/LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
