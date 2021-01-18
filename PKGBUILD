# Maintainer: Martyn van Dijke <martijn_vdijke at hotmail dot com>
# Upstream URL: https://github.com/martynvdijke/gr-lora_sdr
# Based on Pieter Robyns <pieter dot robyn at uhasselt dot be>'s gr-lora-git PKGBUILD

pkgname=gr-lora_sdr-git
pkgver=0.1
pkgrel=1
pkgdesc="GNURadio blocks for fully-functional LoRa transceiver"
arch=('any')
url="https://github.com/martynvdijke/gr-lora_sdr"
license=('GNU General Public License v3.0')
depends=('gnuradio' 'boost' 'swig' 'libvolk' 'libuhd')
makedepends=('cmake')
provides=('gr-lora_sdr')
source=('git+https://github.com/martynvdijke/gr-lora_sdr')
sha1sums=('SKIP')
_gitname=gr-lora

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g' | sed 's/^v//g')
}

build() {
  cd $_gitname
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_gitname
  cd build
  make DESTDIR=${pkgdir} install
}