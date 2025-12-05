# Maintainer: Plague Doctor <plague@example.com>
pkgname=mullvad-tray
pkgver=2.0.0
pkgrel=1
pkgdesc="System tray indicator for Mullvad VPN connection status"
arch=('x86_64')
url="https://gitlab.com/Plague_Doctor/mullvad-tray"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita')
source=(
    "mullvad-tray-${pkgver}::https://gitlab.com/api/v4/projects/76826601/packages/generic/mullvad-tray/v${pkgver}/mullvad-tray"
    "mullvad-tray-${pkgver}.sha256::https://gitlab.com/api/v4/projects/76826601/packages/generic/mullvad-tray/v${pkgver}/mullvad-tray.sha256"
    "mullvad-logo.png"
    "mullvad-tray.desktop"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    # Verify checksum
    cd "$srcdir"
    # The sha256 file expects 'mullvad-tray', but we downloaded as 'mullvad-tray-${pkgver}'
    ln -sf "mullvad-tray-${pkgver}" "mullvad-tray"
    sha256sum -c "mullvad-tray-${pkgver}.sha256"
}

package() {
    # Install binary
    install -Dm755 "$srcdir/mullvad-tray-${pkgver}" "$pkgdir/usr/bin/$pkgname"

    # Install icon
    install -Dm644 "$srcdir/mullvad-logo.png" "$pkgdir/usr/share/pixmaps/mullvad-tray.png"

    # Install desktop entry
    install -Dm644 "$srcdir/mullvad-tray.desktop" "$pkgdir/usr/share/applications/mullvad-tray.desktop"
}
