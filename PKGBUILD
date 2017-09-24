# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-nestopia-git
pkgver=r828.071f04e
pkgrel=1
pkgdesc='Nintendo Entertainment System core'
arch=('i686' 'x86_64')
url='https://github.com/libretro/nestopia'
license=('GPL2')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=('libretro-nestopia')
conflicts=('libretro-nestopia')
source=('libretro-nestopia::git+https://github.com/libretro/nestopia.git'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/nestopia_libretro.info')
sha256sums=('SKIP'
            'eef5ed9b47c0189d03522a69265b96148f5a5e20fcb816b756443f436edc75a8')

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

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  install -m 644 nestopia_libretro.so "${pkgdir}"/usr/lib/libretro/
  install -m 644 ../../nestopia_libretro.info "${pkgdir}"/usr/share/libretro/info/
}

# vim: ts=2 sw=2 et:
