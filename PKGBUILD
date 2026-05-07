# Maintainer: Aloys233 <luodh233@gmail.com>
pkgname=quickflare-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A native-feeling Cloudflare Tunnel GUI for Linux and Windows."
arch=('x86_64')
url="https://github.com/Aloys233/quickflare"
license=('MIT')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'libsecret'
    'openssl'
)
optdepends=(
    'cloudflared: required to create Cloudflare tunnels'
)
provides=('quickflare')
conflicts=('quickflare')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/quickflare-${pkgver}-linux-x86_64.tar.gz"
    "quickflare-128x128-${pkgver}.png::${url}/raw/v${pkgver}/src-tauri/icons/128x128.png"
    "quickflare-32x32-${pkgver}.png::${url}/raw/v${pkgver}/src-tauri/icons/32x32.png"
)
sha256sums=(
    'f6d84254f05b680d84193660c2e1f0bbf96237f818083e293fef46bb4fe8478a'
    '6b4b6962348e985208f41d51daa16874f51aec834f5c75aa3de91d9693965d1c'
    '8384aeba5fbb87c67fad52e2d8ac57521ede6427a4fe69977740e1aac3732e18'
)

package() {
    cd "${srcdir}/quickflare-${pkgver}-linux-x86_64"

    install -Dm755 "quickflare" "${pkgdir}/usr/bin/quickflare"
    install -Dm644 "${srcdir}/quickflare-128x128-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/quickflare.png"
    install -Dm644 "${srcdir}/quickflare-32x32-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/quickflare.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/app.quickflare.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Quickflare
Comment=Local Cloudflare Tunnel manager.
Exec=quickflare
Icon=quickflare
Terminal=false
Categories=Development;
DESKTOP

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
