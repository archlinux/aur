# Maintainer: 9M2PJU <9m2pju@gmail.com>

pkgname=tomoyo-explorer-bin
pkgver=1.00_ALPHA
_tagver=v1.00-ALPHA
pkgrel=2
pkgdesc="Classic BSD/Unix Ruby GTK 1.2 Graphical File Manager by Ariff Abdullah (skywizard)"
arch=('x86_64')
url="https://github.com/9M2PJU/MyBSD-Tomoyo-Explorer"
license=('BSD-2-Clause')
provides=('tomoyo-explorer' 'bsd-explorer')
conflicts=('tomoyo-explorer' 'bsd-explorer')
depends=('zlib')
options=(!strip)

source=("tomoyo-explorer-${pkgver}.AppImage::https://github.com/9M2PJU/MyBSD-Tomoyo-Explorer/releases/download/${_tagver}/MyBSD_Tomoyo_Explorer-x86_64.AppImage"
        "tomoyo-explorer.desktop"
        "LICENSE")
sha256sums=('6d37eb596d95c145002440ed26982c4c3d9733eda11369367a42a2d553264972'
            'b3079b0120fc7dff4490bc08b509f46771319cc7b60b9752e69bcd3c1fb17405'
            '8d7c6f9c0e48a97a52a1fa19dba6fb5113fd59e0271a54228b04686ce16be8c4')

package() {
    install -Dm755 "${srcdir}/tomoyo-explorer-${pkgver}.AppImage" "${pkgdir}/usr/bin/tomoyo-explorer"
    ln -sf /usr/bin/tomoyo-explorer "${pkgdir}/usr/bin/bsd-explorer"
    
    install -Dm644 "${srcdir}/tomoyo-explorer.desktop" "${pkgdir}/usr/share/applications/tomoyo-explorer.desktop"
    
    chmod +x "${srcdir}/tomoyo-explorer-${pkgver}.AppImage"
    "${srcdir}/tomoyo-explorer-${pkgver}.AppImage" --appimage-extract tomoyo-explorer.png >/dev/null 2>&1 || true
    if [ -f "${srcdir}/squashfs-root/tomoyo-explorer.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/tomoyo-explorer.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/tomoyo-explorer.png"
        rm -rf "${srcdir}/squashfs-root"
    fi
    
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
