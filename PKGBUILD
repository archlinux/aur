# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <archi@carsten-teibes.de>

pkgname=reicast
pkgver=r19.07.4
pkgrel=1
pkgdesc='A Sega Dreamcast emulator'
arch=(x86_64)
url=http://reicast.com/
license=(GPL2)
depends=(
  alsa-lib
  libgl
  libudev.so
  python
)
makedepends=(git)
source=(git+https://github.com/reicast/reicast-emulator.git#tag=29e1c8eaaa2686f2be54a59c84bf8c54bdf527d2)
sha256sums=(SKIP)

pkgver() {
  cd reicast-emulator

  git describe --tags
}

prepare() {
  sed "s/CFLAGS :=/CFLAGS := ${CFLAGS}/; s/LDFLAGS :=/LDFLAGS := ${LDFLAGS}/" -i reicast-emulator/reicast/linux/Makefile
}

build () {
  make PREFIX=/usr -C reicast-emulator/reicast/linux
}

package () {
  make DESTDIR="${pkgdir}" PREFIX=/usr -C reicast-emulator/reicast/linux install
}

# vim: ts=2 sw=2 et:
