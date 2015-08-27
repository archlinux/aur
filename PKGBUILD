# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-yabause-git
pkgver=r2680.679eee6
pkgrel=2
pkgdesc='Sega Saturn core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/yabause'
license=('GPL2')
groups=('libretro')
depends=('glibc')
makedepends=('git')
provides=('libretro-yabause')
conflicts=('libretro-yabause')
source=('libretro-yabause::git+https://github.com/libretro/yabause.git'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/yabause_libretro.info')
sha256sums=('SKIP'
            '64b9031e2aee5c0cb821e0b9c6c1b1f2e4ca68d23d0288054a067f730ae350d9')

pkgver() {
  cd libretro-yabause

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-yabause/libretro

  make
}

package() {
  cd libretro-yabause/libretro

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  install -m 644 yabause_libretro.so "${pkgdir}"/usr/lib/libretro/
  install -m 644 ../../yabause_libretro.info "${pkgdir}"/usr/share/libretro/info/
}

# vim: ts=2 sw=2 et:
