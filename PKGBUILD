# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-snes9x-git
pkgver=r515.1ce4378
pkgrel=1
pkgdesc='Super Nintendo Entertainment System core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/snes9x'
license=('custom' 'GPL2' 'LGPL2.1')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=('libretro-snes9x')
conflicts=('libretro-snes9x')
source=('libretro-snes9x::git+https://github.com/libretro/snes9x.git'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/snes9x_libretro.info')
sha256sums=('SKIP'
            'f33c86afa1d776e0c1b10d5b3096d76a72630629f483b5101ce6c28808132af8')

pkgver() {
  cd libretro-snes9x

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-snes9x/libretro

  make
}

package() {
  cd libretro-snes9x/libretro

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  install -m 644 snes9x_libretro.so "${pkgdir}"/usr/lib/libretro/
  install -m 644 ../../snes9x_libretro.info "${pkgdir}"/usr/share/libretro/info/

  install -dm 755 "${pkgdir}"/usr/share/licenses/libretro-snes9x-git
  install -m 644 ../docs/snes9x-license.txt "${pkgdir}"/usr/share/licenses/libretro-snes9x-git/
}

# vim: ts=2 sw=2 et:
