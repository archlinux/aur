# Maintainer: munsternet <munsternet at ik dot me>
pkgname=trackaudio-bin
pkgver=1.0.2_beta.1
pkgrel=1
pkgdesc="Next-generation cross-platform Audio-For-VATSIM ATC Client"
arch=('x86_64')
url="https://github.com/pierr3/TrackAudio"
license=('GPL-3.0-or-later')
source=("https://github.com/pierr3/TrackAudio/releases/download/${pkgver//_/-}/trackaudio_${pkgver//_/.}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('ef032998f487a2b4c0e5e937ecdd15239bb75a3e0917e262b0bd1019477316c4c5a8e59fe808c28aa19b372f4b05df2a660e7eb538f8464d1e72a9871d89d7bb')

package() {
    bsdtar -O -xf "trackaudio_${pkgver//_/.}"*.deb data.tar.zst | bsdtar -C "${pkgdir}" -xJf -

    # Permission fix
    find "${pkgdir}" -type d -exec chmod 755 {} +

    # Remove debian leftovers
    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"

    # Trackaudio expects libafv_native.so in /usr/lib
    ln -s "/usr/lib/trackaudio/libafv_native.so" "${pkgdir}/usr/lib/libafv_native.so"
}

