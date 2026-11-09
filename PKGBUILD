# Maintainer: Arthur <aur@arthurjb.com>
pkgname=telmi-sync-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="Cross-platform application to create and synchronize stories and audio with TelmiOS"
arch=('x86_64')
url="https://github.com/DantSu/Telmi-Sync"
license=('GPL-3.0-only')
depends=('fuse2')
options=('!strip')

source=(
    "telmi-sync-${pkgver}.AppImage::https://github.com/DantSu/Telmi-Sync/releases/download/${pkgver}/Telmi.Sync-${pkgver}-x64.AppImage"
    "telmi-sync.png::https://raw.githubusercontent.com/DantSu/Telmi-Sync/master/electron/build/Icon.png"
    "telmi-sync.desktop"
)
sha256sums=(
    'b3929597268d16788b06d76540b263e7a0f13413088e65d7cf850c762b73733f'
    '3720701886cced6877ac7b512d466fe388c1486dfc34d1c7f78cc3b1f19a6d73'
    'SKIP'
)

package() {
    # Install AppImage
    install -Dm755 "telmi-sync-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/telmi-sync.AppImage"

    # Symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/telmi-sync.AppImage" "${pkgdir}/usr/bin/telmi-sync"

    # Install icon
    install -Dm644 "telmi-sync.png" "${pkgdir}/usr/share/pixmaps/telmi-sync.png"

    # Install .desktop entry
    install -Dm644 "telmi-sync.desktop" "${pkgdir}/usr/share/applications/telmi-sync.desktop"
}
