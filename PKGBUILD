# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <archi@carsten-teibes.de>

pkgname=reicast
pkgver=20.04
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
source=(git+https://github.com/reicast/reicast-emulator.git#tag=r${pkgver})
sha256sums=('SKIP')

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
