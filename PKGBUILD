# Maintainer: 1 2 <fdsfgs@krutt.org>

pkgname=libretro-bsnes-hd-git
pkgver=r1113.9447451b
pkgrel=1
pkgdesc='Super Nintendo Entertainment System cores'
arch=('x86_64')
url='https://github.com/libretro/bsnes'
license=('GPL3')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=('libretro-bsnes')
conflicts=('libretro-bsnes')
source=('libretro-bsnes::git+https://github.com/libretro/bsnes')
sha256sums=('SKIP')

pkgver() {
  cd libretro-bsnes/bsnes

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-bsnes/bsnes

  make target="libretro" binary=library
}

package() {
  cd libretro-bsnes/bsnes

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  install -m 644 out/bsnes_libretro.so "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
