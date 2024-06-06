# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.1.0_beta.10
pkgrel=1
pkgdesc="Next-generation cross-platform Audio-For-VATSIM ATC Client"
arch=('x86_64')
url="https://github.com/pierr3/TrackAudio"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")
depends=()
source=("https://github.com/pierr3/TrackAudio/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_amd64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb")
b2sums=('31315f416a72e56572c6e87ebe208a30362eaa63bccc8baba53f08b81a034c5bd517a31debe991a1e7a4df58490d9a185592af3c2a97ee1b1921a52c8d7d5305')

package() {
    bsdtar -O -xf "${_pkgname}_${pkgver//_/-}"*.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove debian leftovers
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Keep a symlink in /usr/bin for backwards compatibility
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "${pkgdir}/opt/TrackAudio/trackaudio" "${pkgdir}/usr/bin/trackaudio"
}

