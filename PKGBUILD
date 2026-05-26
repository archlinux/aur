# Maintainer: Ondrej Polak <ondrej.polak@cloudylake.io>
pkgname=nook-beta-bin
pkgver=0.1.16
pkgrel=2
pkgdesc="Nook beta desktop app"
arch=('x86_64')
url="https://nook.cloudylake.io"
license=('proprietary')
depends=('alsa-lib' 'gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('libpulse: PulseAudio audio support')
provides=('nook')
conflicts=('nook' 'nook-bin')
source=("nook-${pkgver}.deb::https://nook.cloudylake.io/download/nook-0.1.16-linux.deb")
sha256sums=("6e30b3fa595211cb5c099ccb5ab03a435b8febc30292c12a53fcff9527c40031")

package() {
    bsdtar -xf "nook-${pkgver}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Normalize desktop filename for AUR consumers.
    if [ -f "${pkgdir}/usr/share/applications/Nook.desktop" ]; then
        mv "${pkgdir}/usr/share/applications/Nook.desktop" "${pkgdir}/usr/share/applications/nook.desktop"
    fi
}

options=(!strip)
