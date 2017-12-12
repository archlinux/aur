# Maintainer: Pieter Robyns <pieter.robyns@uhasselt.be>
# Contributors: remspoor
# Upstream URL: https://github.com/rpp0/gr-lora
# Based on Yuval Adam <yuval at y3xz dot com>'s gr-gsm PKGBUILD

pkgname=gr-lora-git
pkgver=0.6.2.3
pkgrel=1
pkgdesc="GNURadio blocks for receiving LoRa modulated radio messages using SDR"
arch=('any')
url="https://github.com/rpp0/gr-lora"
license=(unknown)
depends=('gnuradio' 'libosmocore' 'boost' 'swig' 'liquid-dsp-git' 'python2-scipy' 'python2-numpy')
makedepends=('cmake')
provides=('gr-lora')
source=('git+https://github.com/rpp0/gr-lora')
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
