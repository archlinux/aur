# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-dolphin-git
pkgver=r29735.ec90b9bfcd
pkgrel=1
pkgdesc='Nintendo GC/Wii core'
arch=(x86_64)
url=https://github.com/libretro/dolphin
license=(GPL2)
groups=(libretro-unstable)
depends=(
  libretro-core-info
  libudev.so
  libx11
  libxi
  libxrandr
  zlib
)
makedepends=(
  cmake
  git
  mesa
)
provides=(libretro-dolphin)
conflicts=(libretro-dolphin)
source=(libretro-dolphin::git+https://github.com/libretro/dolphin.git)
sha256sums=(SKIP)

pkgver() {
  cd libretro-dolphin

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../libretro-dolphin \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBRETRO=ON \
    -DLIBRETRO_STATIC=1
  make
}

package() {
  install -Dm 644 build/dolphin_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
