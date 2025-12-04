# Maintainer: MoldyTaint <MoldyTaint@protonmail.com>

pkgname=wifiman-desktop-bin
pkgver=1.2.8
pkgrel=1
pkgdesc="WiFi analysis and network insights tool by Ubiquiti"
arch=('x86_64')
url="https://desktop.wifiman.com/"
license=('custom')
depends=(
    'net-tools'
    'iw'
    'openresolv'           # resolvconf provider
    'libayatana-appindicator'
    'webkit2gtk-4.1'
    'gtk3'
)
provides=('wifiman-desktop')
conflicts=('wifiman-desktop' 'wi-fiman-desktop')
replaces=('wi-fiman-desktop')
source=("${pkgname}-${pkgver}.deb::https://desktop.wifiman.com/wifiman-desktop-${pkgver}-amd64.deb")
sha256sums=('47e31bc317e7055f5571859e33534cd3c2d7d4ccfdf9fcb8afab9920bc9d964b')
options=(!strip)

package() {
    # Extract the .deb package
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
    
    # Fix permissions
    chmod 755 "${pkgdir}/usr/bin/wifiman-desktop"
    chmod 755 "${pkgdir}/usr/lib/wifiman-desktop/wifiman-desktopd"
    chmod 755 "${pkgdir}/usr/lib/wifiman-desktop/wg"
    chmod 755 "${pkgdir}/usr/lib/wifiman-desktop/wg-quick"
    chmod 755 "${pkgdir}/usr/lib/wifiman-desktop/wireguard-go"
    
    # Install license (if exists in package)
    # The package doesn't include a license file, so we note it's proprietary
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Proprietary software by Ubiquiti, Inc.
License terms: https://ui.com/legal/termsofservice
EOF
}
