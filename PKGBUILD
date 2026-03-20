# Maintainer: uwuclxdy <uwuclxdy@pm.me>

pkgname=piebald-bin
pkgver=0.1.22
pkgrel=1
pkgdesc='The ultimate agentic AI control experience for developers'
arch=('x86_64')
url='https://piebald.ai'
license=('LicenseRef-Piebald-EULA')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'alsa-lib'
)
optdepends=(
    'libayatana-appindicator: system tray support'
)
provides=('piebald')
conflicts=('piebald')
options=(!strip !debug)
source=("https://github.com/Piebald-AI/piebald/releases/download/v${pkgver}/Piebald_${pkgver}_amd64.deb")
sha256sums=('7dd90a4c1a4118317e3b8ab6ffb128f01fc58737a06a00fe297639f5eec221e0')

package() {
    bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}/"

    # Tauri binary expects Debian multiarch paths for WebKit helper processes
    install -d "${pkgdir}/usr/lib/x86_64-linux-gnu"
    ln -s /usr/lib/webkit2gtk-4.1 "${pkgdir}/usr/lib/x86_64-linux-gnu/webkit2gtk-4.1"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Piebald is proprietary software by Piebald LLC.
Terms & Conditions: https://piebald.ai/terms
Privacy Policy: https://piebald.ai/privacy
EOF
}
