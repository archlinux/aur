# Maintainer: Plague Doctor <plague@example.com>
pkgname=mullvad-tray-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="System tray indicator for Mullvad VPN connection status (binary package)"
arch=('x86_64')
url="https://gitlab.com/Plague_Doctor/mullvad-tray"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita')
provides=("mullvad-tray=${pkgver}")
conflicts=("mullvad-tray")
replaces=("mullvad-tray<=2.0.2")
source=(
    "mullvad-tray-${pkgver}::https://gitlab.com/api/v4/projects/76826601/packages/generic/mullvad-tray/v${pkgver}/mullvad-tray"
    "mullvad-logo.png"
    "mullvad-tray.desktop"
)
# IMPORTANT: Update the first checksum when updating pkgver
# Calculate with: sha256sum mullvad-tray
# Never use 'SKIP' - hardcoded checksums prevent supply chain attacks
sha256sums=('00fe90b34098576f2b43fa55df62374dd7096e81e3cd7312c320e8f85dc77d05'
            '0579591a7d2128928a4d54830b46c911f4aedc432aa7a91252b0f0db3f5d85ce'
            '5bb650a5a68cf38e72f23eadda491a05a6eac9a5554a8db80fe711f1eb9f6eac')

package() {
    # Install binary (without -bin suffix)
    install -Dm755 "$srcdir/mullvad-tray-${pkgver}" "$pkgdir/usr/bin/mullvad-tray"

    # Install icon
    install -Dm644 "$srcdir/mullvad-logo.png" "$pkgdir/usr/share/pixmaps/mullvad-tray.png"

    # Install desktop entry
    install -Dm644 "$srcdir/mullvad-tray.desktop" "$pkgdir/usr/share/applications/mullvad-tray.desktop"
}
