# Maintainer: Ondrej Polak <ondrej.polak@cloudylake.io>
pkgname=nook-beta-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="Nook beta desktop app"
arch=('x86_64')
url="https://nook.cloudylake.io"
license=('proprietary')
depends=('alsa-lib' 'gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('libpulse: PulseAudio audio support')
provides=('nook')
conflicts=('nook' 'nook-bin')
source=("nook-${pkgver}.deb::https://nook.cloudylake.io/download/nook-0.1.15-linux.deb")
sha256sums=("453ea0030536eff31c8ce38fac88f3cea3013d48f6ac337695cb4c000a9a04bf")

package() {
    bsdtar -xf "nook-${pkgver}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Normalize desktop filename for AUR consumers.
    if [ -f "${pkgdir}/usr/share/applications/Nook.desktop" ]; then
        mv "${pkgdir}/usr/share/applications/Nook.desktop" "${pkgdir}/usr/share/applications/nook.desktop"
    fi
}

options=(!strip)
