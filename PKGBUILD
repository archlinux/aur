# Maintainer: munsternet <munsternet at ik dot me>
pkgname=trackaudio-bin
pkgver=1.0.2_beta.2
pkgrel=1
pkgdesc="Next-generation cross-platform Audio-For-VATSIM ATC Client"
arch=('x86_64')
url="https://github.com/pierr3/TrackAudio"
license=('GPL-3.0-or-later')
depends=()
source=("https://github.com/pierr3/TrackAudio/releases/download/${pkgver//_/-}/trackaudio_${pkgver//_/.}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('2da7d1980a3f699e8b1f117506aebd1461a2710b2f9ff141f3c600efac249227c7e9fe4bc19cbd367168c6f279d50ebf6f21569fa8956a443b13055f78ed37b1')

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

