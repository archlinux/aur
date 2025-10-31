# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>
# Contributor Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-beetle-ngp-git
pkgver=r1051.139fe34
pkgrel=1
pkgdesc='Neo Geo Pocket/Color core'
arch=('x86_64' 'aarch64')
url='https://github.com/libretro/beetle-ngp-libretro'
license=('GPL-2.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git' 'make')
provides=('libretro-beetle-ngp')
conflicts=('libretro-beetle-ngp')

source=('libretro-beetle-ngp::git+https://github.com/libretro/beetle-ngp-libretro.git')
sha256sums=('SKIP')

pkgver() {
  cd libretro-beetle-ngp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  make -C libretro-beetle-ngp
}

package() {
  install -D -t "${pkgdir}"/usr/lib/libretro/ libretro-beetle-ngp/mednafen_ngp_libretro.so
}
