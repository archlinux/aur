# Maintainer: snapetech <iptvtunerr@proton.me>
pkgname=iptvtunerr-bin
_pkgname=iptvtunerr
pkgver=0.1.63
pkgrel=1
pkgdesc="IPTV to Plex, Emby, and Jellyfin bridge with HDHomeRun-style tuner and XMLTV guide support (prebuilt binary)"
arch=('x86_64')
url="https://github.com/snapetech/iptvtunerr"
license=('AGPL-3.0-or-later')
depends=('glibc')
optdepends=(
    'ffmpeg: transcoding and packaged HLS/fMP4 stream profiles'
    'fuse3: VOD filesystem mount support'
)
provides=('iptvtunerr')
conflicts=('iptvtunerr')
backup=('etc/iptvtunerr/iptvtunerr.env')
install=iptvtunerr.install
source=(
    "iptv-tunerr-v${pkgver}-linux-amd64.tar.gz::https://github.com/snapetech/iptvtunerr/releases/download/v${pkgver}/iptv-tunerr-v${pkgver}-linux-amd64.tar.gz"
    "iptvtunerr.service"
    "iptvtunerr.env"
    "iptvtunerr.sysusers"
    "iptvtunerr.tmpfiles"
)
sha256sums=('SKIP'
            '3ba54b6cd8f7ddd4d0e50f19bca2836e967cd21af79bc5799c87f3d9f47b1c20'
            '003bc691e90ca5e98797ed2347494920d9bda7eca45858bad4d836122adb1619'
            'f99639cf60b2c67c1cd1d839680ad665fec89beeac243fe2130e5cda75961db5'
            'aeda5941c781c7d809af74180eebac6978f3871bb17cd02ceadf74fb42aad06d')

package() {
    install -Dm755 "${srcdir}/iptv-tunerr-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/iptv-tunerr"

    install -Dm644 "${srcdir}/iptvtunerr.service" "${pkgdir}/usr/lib/systemd/system/iptvtunerr.service"
    install -Dm644 "${srcdir}/iptvtunerr.env" "${pkgdir}/etc/iptvtunerr/iptvtunerr.env"
    install -Dm644 "${srcdir}/iptvtunerr.sysusers" "${pkgdir}/usr/lib/sysusers.d/iptvtunerr.conf"
    install -Dm644 "${srcdir}/iptvtunerr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/iptvtunerr.conf"
}
