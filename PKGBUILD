# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-nestopia-git
pkgver=r851.e4b6750
pkgrel=1
pkgdesc='Nintendo Entertainment System core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/nestopia'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=('libretro-nestopia')
conflicts=('libretro-nestopia')
source=('libretro-nestopia::git+https://github.com/libretro/nestopia.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-nestopia

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-nestopia/libretro

  export CXXFLAGS="$CXXFLAGS -fpermissive"

  make
}

package() {
  cd libretro-nestopia/libretro

  install -Dm 644 nestopia_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
