# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-flycast-git
pkgver=r3644.8f861517
pkgrel=1
pkgdesc='Sega Dreamcast core'
arch=(x86_64)
url=https://github.com/libretro/flycast
license=(GPL2)
groups=(libretro-unstable)
depends=(
  libgl
  libretro-core-info
)
makedepends=(
  git
)
provides=(libretro-flycast)
conflicts=(libretro-flycast)
source=(libretro-flycast::git+https://github.com/libretro/flycast.git)
sha256sums=(SKIP)

pkgver() {
  cd libretro-flycast

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd libretro-flycast

  sed 's/^HAVE_OIT.*:=.*/HAVE_OIT := 1/;
       s/^CFLAGS.*:=.*/CFLAGS := ${CFLAGS}/;
       s/^CXXFLAGS.*:=.*/CXXFLAGS := ${CXXFLAGS}/;
       s/^LDFLAGS.*:=.*/LDFLAGS := ${LDFLAGS}/;' -i Makefile
}

build() {
  make -C libretro-flycast
}

package() {
  install -Dm 644 libretro-flycast/flycast_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
