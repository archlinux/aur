# Maintainer: Lluciocc <llucio.cc00@example.com>
pkgname=connex
pkgver=1.3.0
pkgrel=1
pkgdesc="Modern Wi-Fi Manager for Hyprland/ArchLinux with GTK3 interface"
arch=('any')
url="https://github.com/Lluciocc/connex"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk3'
    'networkmanager'
    'libappindicator-gtk3'
    'libnotify'
)
optdepends=(
    'papirus-icon-theme: Better icons'
    'hyprland: Recommended window manager'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a5d6e485979b60aba91ee9a578a89fdb8756928d9795093ab57e850c0fb96cca')

# For local development, use:
# source=("connex.py")
# sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install main script
    install -Dm755 connex.py "${pkgdir}/usr/bin/connex"

    # Install assets
    install -Dm644 assets/core/speedtest.py "${pkgdir}/usr/lib/connex/assets/core/speedtest.py"
    install -Dm644 assets/tray/system_tray.py "${pkgdir}/usr/lib/connex/assets/tray/system_tray.py"
    install -Dm644 assets/utils/debug.py "${pkgdir}/usr/lib/connex/assets/utils/debug.py"
    install -Dm644 assets/ui/dialogs.py "${pkgdir}/usr/lib/connex/assets/ui/dialogs.py"
    install -Dm644 assets/ui/main_window.py "${pkgdir}/usr/lib/connex/assets/ui/main_window.py"
    install -Dm644 assets/core/proxies.py "${pkgdir}/usr/lib/connex/assets/core/proxies.py"
    
    # Desktop file
    install -Dm644 connex.desktop "${pkgdir}/usr/share/applications/connex.desktop"

    # Icon
    install -Dm644 connex.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/connex.svg"

    # Autostart
    install -Dm644 connex-tray.desktop "${pkgdir}/etc/xdg/autostart/connex-tray.desktop"

    # License & docs
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
