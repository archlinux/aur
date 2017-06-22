# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-redream-git
pkgver=r784.9214e458
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/redream'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libgl')
makedepends=('git')
provides=('libretro-redream')
conflicts=('libretro-redream')
source=('libretro-redream::git+https://github.com/libretro/redream.git'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/redream_libretro.info')
sha256sums=('SKIP'
            'a14013c3920883cd48db9c7a3570ade6f2ed2f9489b02d48360f0ad4fe08b149')

pkgver() {
  cd libretro-redream

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-redream

  make -f Makefile.libretro
}

package() {
  cd libretro-redream

  install -Dm 644 redream_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 ../redream_libretro.info -t "${pkgdir}"/usr/share/libretro/info/
}

# vim: ts=2 sw=2 et:
