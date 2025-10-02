# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=gcfflasher
pkgver=4.10.0
pkgrel=1
pkgdesc="Tool to program the firmware of dresden elektronik's Zigbee products."
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/dresden-elektronik/gcfflasher"
license=(BSD-3-Clause)
depends=(libgpiod)
makedepends=(git cmake)
source=("gcfflasher::git+https://github.com/dresden-elektronik/gcfflasher.git#tag=v${pkgver}")
sha256sums=('6b066365343e480960af7d6e0ecb43beab7b870ae1a6677597e0baadca19b078')

build() {
  cmake -B build -S "gcfflasher" -Wno-dev\
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "gcfflasher/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
