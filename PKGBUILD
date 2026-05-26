# Maintainer: Ondrej Polak <ondrej.polak@cloudylake.io>
pkgname=nook-beta-bin
pkgver=0.1.16
pkgrel=5
pkgdesc="Nook beta desktop app"
arch=('x86_64')
url="https://nook.cloudylake.io"
license=('proprietary')
depends=('alsa-lib' 'gtk3' 'libayatana-appindicator' 'webkit2gtk-4.1')
optdepends=('libpulse: PulseAudio audio support')
provides=('nook')
conflicts=('nook' 'nook-bin')
source=("nook-${pkgver}-${pkgrel}.deb::https://nook.cloudylake.io/download/nook-0.1.16-linux.deb")
sha256sums=("8dacb802b2f05a06df401b229569c2f52ab867dcce5b1d2fb76c84265cfbeb06")

package() {
    bsdtar -xf "nook-${pkgver}-${pkgrel}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Normalize desktop filename for AUR consumers.
    if [ -f "${pkgdir}/usr/share/applications/Nook.desktop" ]; then
        mv "${pkgdir}/usr/share/applications/Nook.desktop" "${pkgdir}/usr/share/applications/nook.desktop"
    fi
}

options=(!strip)
