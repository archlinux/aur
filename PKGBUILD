# Maintainer: Anthony Wang <ta180m@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-bsnes-git
pkgver=r3048.44d97b17
pkgrel=1
pkgdesc='Super Nintendo Entertainment System cores'
arch=(x86_64)
url=https://github.com/libretro/bsnes
license=(GPL3)
groups=(libretro-unstable)
depends=(
  gcc-libs
  libretro-core-info
)
makedepends=(git)
provides=(libretro-bsnes)
conflicts=(libretro-bsnes)
source=(
  libretro-bsnes::git+https://github.com/libretro/bsnes-libretro
  libretro-bsnes-flags.patch
)
sha256sums=(
  SKIP
  3e1704ba3e7175330a0e291fbeb1e0bee18518ac29a2008d984585fb7a9b887c
)

pkgver() {
  cd libretro-bsnes

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd libretro-bsnes

  patch -Np1 -i ../libretro-bsnes-flags.patch
}

build() {
  make -C libretro-bsnes/bsnes target=libretro binary=library local=false platform=linux
}

package() {
  install -Dm 644 libretro-bsnes/bsnes/out/bsnes_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
