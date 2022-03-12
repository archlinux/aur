# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-retrodream
pkgver=1104
pkgrel=2
pkgdesc='Sega Dreamcast core'
arch=(x86_64)
url=https://github.com/libretro/retrodream
license=(GPL2)
groups=(libretro)
depends=(
  libgl
  libretro-core-info
)
makedepends=(
  git
  mesa
)
replaces=(libretro-redream)
_commit=bf4d812daf326c56e99208a4c30acae1475fd701
# git repo is gone
#source=(libretro-retrodream::git+https://github.com/libretro/retrodream.git#commit=${_commit})
source=(https://sources.archlinux.org/other/community/libretro/libretro-retrodream-$pkgver.tar.gz)
sha256sums=('c73e773d999e4c5c44792eea09a88d0a3741c3bcd3f16b37070bcc0b5b49d56e')

pkgver() {
  cd libretro-retrodream

  git rev-list --count HEAD
}

prepare() {
  git clone libretro-retrodream src
  cd src
  git checkout $_commit
}

build() {
  make -C src/deps/libretro
}

package() {
  install -Dm 644 src/deps/libretro/retrodream_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
