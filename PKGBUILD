# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.0.2_beta.7
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
b2sums=('f3ac69372c44ab4e1554423cfbe0b7a13cf4adbe7a40c4b84322df31cf2e959d03fd877aa44372da7369f996c8e8d66305a971b03152faf8e03bb04b0f5da35d')

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

