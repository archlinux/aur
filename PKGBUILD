# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

_name=Cadence
pkgname=cadence
pkgver=0.8.1
pkgrel=8
pkgdesc="JACK toolbox for audio production."
arch=('x86_64')
url="https://kxstudio.linuxaudio.org/Applications:Cadence"
license=('GPL2')
groups=('pro-audio')
depends=('jack' 'python-dbus' 'python-pyqt4')
makedepends=('a2jmidid' 'jack_capture' 'libpulse' 'pulseaudio-jack' 'python-rdflib' 'zita-ajbridge')
optdepends=('a2jmidid: ALSA to JACK MIDI bridge'
            'jack_capture: recording via Cadence-Render'
            'pulseaudio-jack: PulseAudio to JACK bridge'
            'python-rdflib: LADSPA-RDF support in Carla'
            'zita-ajbridge: ALSA to JACK bridge')
source=("https://downloads.sourceforge.net/project/kxstudio/Releases/${pkgname}/${_name}-${pkgver}-src.tar.bz2")
sha512sums=('333a8532859cfa4ca61446b6b136baa7930d2a9d1acbb55e2ee296998604c0e8e3effd5e21fe3154caf8ae6534190a0f592b070b671164ccfd647567ba2cc33f')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  # docs
  install -t "${pkgdir}/usr/share/doc/${pgkname}/" -vDm644 {README.md,TODO}
}

