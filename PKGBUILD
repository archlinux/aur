# Maintainer: Plague Doctor <plague@example.com>
pkgname=mullvad-tray
pkgver=0.9.9
pkgrel=1
pkgdesc="System tray indicator for Mullvad VPN connection status"
arch=('x86_64')
url="https://gitlab.com/Plague_Doctor/mullvad-tray"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita')
source=(
    "mullvad-tray-${pkgver}::https://gitlab.com/api/v4/projects/76826601/packages/generic/mullvad-tray/v${pkgver}/mullvad-tray"
    "mullvad-tray-${pkgver}.sha256::https://gitlab.com/api/v4/projects/76826601/packages/generic/mullvad-tray/v${pkgver}/mullvad-tray.sha256"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    # Verify checksum
    cd "$srcdir"
    # The sha256 file expects 'mullvad-tray', but we downloaded as 'mullvad-tray-${pkgver}'
    ln -sf "mullvad-tray-${pkgver}" "mullvad-tray"
    sha256sum -c "mullvad-tray-${pkgver}.sha256"
}

package() {
    install -Dm755 "$srcdir/mullvad-tray-${pkgver}" "$pkgdir/usr/bin/$pkgname"
}
