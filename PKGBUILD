# Maintainer: redtide <redtid3@gmail.com>

_pkgname="catia"
pkgname="${_pkgname}-git"
pkgver=r1062.78b0307
pkgrel=1
pkgdesc="Catia is a nice and simple JACK Patchbay, with integrated JACK Transport."
url="https://kx.studio/Applications:Catia"
arch=("x86_64")
license=("GPL2")
makedepends=("git")
depends=("python-pyqt5")
optdepends=(
    "a2jmidid: A daemon for exposing legacy ALSA sequencer applications in JACK MIDI system."
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "cadence")
source=("${_pkgname}"::"git+https://github.com/falkTX/Catia")
sha512sums=("SKIP")
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${_pkgname}"
    make
}
package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}/" PREFIX=/usr install
    install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
