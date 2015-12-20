# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-nestopia-git
pkgver=r612.7c8d9d9
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
            'eea21d5c2fb0fe95c2f84c8e957b18a7898699a3899e784f94feb87f68c847b1')

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
