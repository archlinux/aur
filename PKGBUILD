# Maintainer: Regaan <contact@rothackers.com>
pkgname=wshawk
pkgver=3.0.1
pkgrel=1
pkgdesc="Enterprise-grade WebSocket Security Scanner & Web Pentest Toolkit by Rot Hackers"
arch=('x86_64')
url="https://wshawk.rothackers.com"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme' 'libglvnd')
provides=('wshawk')
conflicts=('wshawk')
source=("wshawk-${pkgver}.AppImage::https://github.com/regaan/wshawk/releases/download/v${pkgver}/wshawk-${pkgver}.AppImage")
sha256sums=('cce4b6995fd760a795daf930f4e546ea0eed9ce703e62055d33413b809dfe141')

package() {
    # Make AppImage executable
    chmod +x "${srcdir}/wshawk-${pkgver}.AppImage"

    # Extract AppImage into /opt/wshawk
    "${srcdir}/wshawk-${pkgver}.AppImage" --appimage-extract
    mv squashfs-root "${pkgdir}/opt/wshawk"

    # Symlink AppRun to /usr/bin/wshawk
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/wshawk/AppRun" "${pkgdir}/usr/bin/wshawk"

    # Optional: Install desktop entry or icons if you have them
    # mkdir -p "${pkgdir}/usr/share/applications"
    # install -Dm644 "wshawk.desktop" "${pkgdir}/usr/share/applications/wshawk.desktop"
}