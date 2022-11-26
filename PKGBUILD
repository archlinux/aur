# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=libretro-scummvm-diablodiab-git
pkgver=36.ae6998e
pkgrel=1
pkgdesc="ScummVM core (diablodiab's backend)"
arch=(x86_64 aarch64)
url=https://github.com/diablodiab/libretro-scummvm-backend
license=(GPL)
groups=(libretro)
depends=(libretro-core-info)
makedepends=(git)
conflicts=(libretro-scummvm)
source=(git+https://github.com/scummvm/scummvm.git git+https://github.com/diablodiab/libretro-scummvm-backend.git)
sha256sums=(SKIP SKIP)

prepare() {
  mv libretro-scummvm-backend scummvm/backends/platform/libretro
}

pkgver() {
  cd scummvm/backends/platform/libretro
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd scummvm/backends/platform/libretro/build
  make clean
  make

  ../aux-data/bundle_aux_data.bash
}

package() {
  install -Dm 644 scummvm/backends/platform/libretro/build/scummvm_libretro.so -t "${pkgdir}/usr/lib/libretro/"
  install -Dm 644 scummvm/backends/platform/libretro/aux-data/scummvm.zip -t "${pkgdir}/usr/share/${pkgname}/"
}
