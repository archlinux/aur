# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-bsnes-hd-git
pkgver=r1090.3a2f757e
pkgrel=1
pkgdesc='Super Nintendo Entertainment System cores'
arch=('x86_64')
url='https://github.com/libretro/bsnes'
license=('GPL3')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=('libretro-bsnes-hd')
conflicts=('libretro-bsnes-hd')
source=('libretro-bsnes::git+https://github.com/libretro/bsnes')
sha256sums=('SKIP')

pkgver() {
  cd libretro-bsnes/bsnes

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-bsnes/bsnes

  #for p in accuracy balanced performance; do
  #  make profile=${p} target="libretro"
  #done
  make target="libretro"
}

package() {
  cd libretro-bsnes/bsnes

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  #for p in accuracy balanced performance; do
  #  install -m 644 out/bsnes_${p}_libretro.so "${pkgdir}"/usr/lib/libretro/
  #done
  install -m 644 out/bsnes_libretro.so "${pkgdir}"/usr/lib/libretro/bsnes_hd_libretro.so
}

# vim: ts=2 sw=2 et:
