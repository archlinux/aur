# Maintainer: Ondrej Polak <ondrej.polak@cloudylake.io>
pkgname=nook-beta-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Nook beta desktop app"
arch=('x86_64')
url="https://nook.cloudylake.io"
license=('proprietary')
depends=('alsa-lib' 'gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('libpulse: PulseAudio audio support')
provides=('nook')
conflicts=('nook' 'nook-bin')
source=("nook-${pkgver}.deb::https://nook.cloudylake.io/download/nook-0.1.3-linux.deb")
sha256sums=("adc0fb717a5d3b86e9b154bdf993cb5ab57719a268b673468fcbd728d87e917a")

package() {
    bsdtar -xf "nook-${pkgver}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Normalize desktop filename for AUR consumers.
    if [ -f "${pkgdir}/usr/share/applications/Nook.desktop" ]; then
        mv "${pkgdir}/usr/share/applications/Nook.desktop" "${pkgdir}/usr/share/applications/nook.desktop"
    fi
}

options=(!strip)
