# Maintainer:
_pkgbase=antigravity
pkgname=antigravity-bin-bubblewrap
pkgver=1.11.9
_buildid=4787439284912128
pkgrel=1
pkgdesc="Antigravity - Google Agentic IDE (Sandboxed to ~/AntigravityWorkspace)"
arch=('x86_64')
url="https://antigravity.google"
license=('custom')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib' 'libxtst' 'xdg-utils' 'bubblewrap' 'libdrm' 'mesa')
provides=('antigravity' 'antigravity-bin')
conflicts=('antigravity' 'antigravity-bin')
source=(
    "https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz"
    "antigravity-launcher.sh"
    "antigravity.desktop"
    "antigravity.png"
)
sha256sums=(
    'd1b1115ae76c275c376ea660e1e4d2dc20eb3e72d6a206b096505b944a5f64b7'
    'bcf357c8536ca4b55882419d4af6bf3c82e7663db89ea5dac2d9304bc46e83ba'
    '0f62203f33c165dbda0ed80c750369ad7c1f93378e2d51f4ff478e59198cfb41'
    '8f0b95d2d21dbf930b4d100e2fdc4505673e900a731aa56ea633a4b59c312799'
)

prepare() {
    # DISABLE AUTO-UPDATE: Electron apps use this file for update checks.
    msg2 "Disabling internal auto-updater..."
    rm -f "Antigravity/resources/app-update.yml"
}

package() {
    # Install Application to /opt
    install -d "${pkgdir}/opt/${_pkgbase}"
    cp -a "Antigravity/"* "${pkgdir}/opt/${_pkgbase}/"
    install -Dm755 "antigravity-launcher.sh" "${pkgdir}/usr/bin/antigravity"
    install -Dm644 "antigravity.desktop" "${pkgdir}/usr/share/applications/antigravity.desktop"
    install -Dm644 "antigravity.png" "${pkgdir}/usr/share/pixmaps/antigravity.png"
}
