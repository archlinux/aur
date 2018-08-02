# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=cadence-git
pkgver=r1019.b82db9a
pkgrel=1
epoch=1
pkgdesc="JACK toolbox for audio production."
arch=('i686' 'x86_64')
url="https://kxstudio.linuxaudio.org/Applications:Cadence"
license=('GPL2')
depends=('hicolor-icon-theme' 'jack' 'python-dbus' 'python-pyqt5' 'qt5-svg')
makedepends=('a2jmidid' 'jack_capture' 'libpulse' 'pulseaudio-jack' 'python-rdflib' 'zita-ajbridge' 'git')
optdepends=('a2jmidid: ALSA to JACK MIDI bridge'
            'jack_capture: recording via Cadence-Render'
            'pulseaudio-jack: PulseAudio to JACK bridge'
            'python-rdflib: LADSPA-RDF support in Carla'
            'zita-ajbridge: ALSA to JACK bridge')
provides=('cadence')
conflicts=('cadence')
source=("${pkgname}::git://github.com/falkTX/Cadence.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
    # docs
    install -vDm 644 {README.md,TODO} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}

# vim:set ts=4 sw=4 et:
