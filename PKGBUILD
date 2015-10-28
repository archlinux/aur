# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-nestopia-git
pkgver=r606.eeda3a8
pkgrel=1
pkgdesc='Nintendo Entertainment System core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/nestopia'
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=('libretro-nestopia')
conflicts=('libretro-nestopia')
source=('libretro-nestopia::git+https://github.com/libretro/nestopia.git'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/nestopia_libretro.info')
sha256sums=('SKIP'
            '72585a62b7cefa3b8a5e050f696c3d174b798f21fa69131643bb62a0a1acd937')

pkgver() {
  cd libretro-nestopia

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-nestopia/libretro

  make
}

package() {
  cd libretro-nestopia/libretro

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  install -m 644 nestopia_libretro.so "${pkgdir}"/usr/lib/libretro/
  install -m 644 ../../nestopia_libretro.info "${pkgdir}"/usr/share/libretro/info/
}

# vim: ts=2 sw=2 et:
