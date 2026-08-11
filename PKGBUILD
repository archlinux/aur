# Maintainer Ethan Geller (ethang@valvesoftware.com)

pkgname=steamdeck-dsp
_srctag=0.99
pkgver=${_srctag#galileo-}
pkgrel=2
arch=('any')
url=""
pkgdesc="Steamdeck Audio Processing"
license=('Proprietary')
depends=('pipewire' 'pipewire-audio' 'noisetorch')
makedepends=('git' 'openssh' 'base-devel' 'glibc' 'faust' 'ladspa' 'lv2' 'boost' 'linux-api-headers' 'qt5-base')
install="${pkgname}.install"
source=("git+https://github.com/evlav/valve-hardware-audio-processing.git#tag=$_srctag")
sha512sums=('90eecbb45d5617adbb507d553e9095517d1541c888c1a0bad26d228cd7fcdd077d3e46506153cd9f3f371f44fdbe7d39a63a4faf43f731862601f15be23bddbc')

build() {
  cd valve-hardware-audio-processing
  make FAUSTINC="/usr/include/faust"  FAUSTLIB="/usr/share/faust"
}

package() {
  cd valve-hardware-audio-processing
  make DEST_DIR="$pkgdir/" install
}
