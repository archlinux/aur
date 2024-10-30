# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.3.0_beta.3
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
b2sums=('bc32232e24b98d17d9c5818724b88356511c18276ca1dafa86bbb1f7747886c4b09df28cc86a5defb0194d1f7ca0fd2e5b4a27ae79b7bc09d1542b5464b99b44')

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
