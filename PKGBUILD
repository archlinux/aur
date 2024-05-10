# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.0.2_beta.4
pkgrel=1
pkgdesc="Next-generation cross-platform Audio-For-VATSIM ATC Client"
arch=('x86_64')
url="https://github.com/pierr3/TrackAudio"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")
depends=()
source=("https://github.com/pierr3/TrackAudio/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/.}_amd64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb")
b2sums=('ada239418cf242080800d981e1f7697443e1c2c258a19ce68c2a966fcf2f496f88a22171aae5c83ac68c6cff67ba83164d1cabb757fc9d66077e3942c065cb31')

package() {
    bsdtar -O -xf "${_pkgname}_${pkgver//_/.}"*.deb data.tar.zst | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove debian leftovers
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Trackaudio expects libafv_native.so in /usr/lib
    ln -s "/usr/lib/${_pkgname}/libafv_native.so" "${pkgdir}/usr/lib/libafv_native.so"
}

