# Maintainer: Ayatale <ayatale8@gmail.com>

pkgname=obs-plugin-waveform-bin
_pkgname=${pkgname%-bin}
pkgver=1.6.1
pkgrel=1
pkgdesc="Waveform is an audio spectral analysis plugin for OBS Studio"
arch=("x86_64")
url="https://github.com/phandasm/waveform"
license=("GPL3")
depends=("obs-studio>=28.0.0")
makedepends=("tar")
conflicts=("${_pkgname}-git")
options=("!strip" "emptydirs")
source=("${url}/releases/download/v${pkgver}/Waveform_v${pkgver}_Ubuntu_x86_64.deb")
sha256sums=("8ac0bdc4e9f4d5b9de1318f73c440413485a0f4e7422d4dbf9a0bb61193951d1")

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

build() {
  rm -rf ${srcdir}/build
  mkdir -p ${srcdir}/build
  tar -xf ${srcdir}/data.tar.gz -C ${srcdir}/build 
}

package() {
  cd ${srcdir}/build/
  install -Dm755 usr/lib/x86_64-linux-gnu/obs-plugins/waveform.so -t ${pkgdir}/usr/lib/obs-plugins/
  find usr/share/obs/obs-plugins/waveform -type f -exec install -Dm755 {} ${pkgdir}/{} \;
}