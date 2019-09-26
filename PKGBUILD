# Author: Prism019 <derektutaj at gmail dot com>
# Original Maintainer: David Runge <dave@sleepmap.de>
# Original Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Original Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence-claudia
srcname=cadence
pkgver=0.9.0
pkgrel=1
pkgdesc="JACK toolbox for audio production. (With claudia)"
arch=('x86_64')
url="https://kxstudio.linuxaudio.org/Applications:Cadence"
license=('GPL2')
depends=('hicolor-icon-theme' 'jack' 'ladish' 'python-dbus' 'python-pyqt5' 'qt5-svg')
optdepends=('a2jmidid: ALSA to JACK MIDI bridge'
            'jack_capture: recording via Cadence-Render'
            'pulseaudio-jack: PulseAudio to JACK bridge'
            'python-rdflib: LADSPA-RDF support in Carla'
            'zita-ajbridge: ALSA to JACK bridge')
conflicts=('cadence')
provides=('cadence')
source=("${srcname}-${pkgver}.tar.gz::https://github.com/falkTX/Cadence/archive/v0.9.0.tar.gz")
sha512sums=('381c9c57c1d96452a91969e134420d63ef06f5ec144050779d0a06a1098e8ed1693c70165b6640e04acc448d382e717e71ead1b29ba5043f0668675850cad7d1')

prepare() {
  mv -v "${_name}-${pkgver}" "${srcname}-${pkgver}"
}

build() {
  cd "${srcname}-${pkgver}"
  make
}

package() {
  cd "${srcname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # docs
  install -vDm 644 {README.md,TODO} -t "${pkgdir}/usr/share/doc/${srcname}/"
}
