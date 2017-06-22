# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-dolphin-git
pkgver=r23904.54445a0a87
pkgrel=1
pkgdesc='Nintendo GC/Wii core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/dolphin'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=('libretro-dolphin')
conflicts=('libretro-dolphin')
source=('libretro-dolphin::git+https://github.com/libretro/dolphin.git'
        'git+https://github.com/libretro/libretro-core-info.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd libretro-dolphin

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-dolphin/Source/Core/DolphinLibretro

  make
}

package() {
  cd libretro-dolphin/Source/Core/DolphinLibretro

  install -Dm 644 dolphin_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 ../../../../libretro-core-info/dolphin_libretro.info -t "${pkgdir}"/usr/share/libretro/info/
}

# vim: ts=2 sw=2 et:
