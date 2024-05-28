# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.0.2_beta.5
pkgrel=2
pkgdesc="Next-generation cross-platform Audio-For-VATSIM ATC Client"
arch=('x86_64')
url="https://github.com/pierr3/TrackAudio"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")
depends=()
source=("https://github.com/pierr3/TrackAudio/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/.}_amd64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb")
b2sums=('c7142a94a59b406ac08f7b67aed336575f921894ec5c3d03f2ae6ef2fe64cc8d154fb35b39d37e0acb6c41157d8ec5b4f5c1c40d8a6ae08450ff212cf92a9a29')

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

