# Maintainer: Hans-Dieter Buddenberg <hbuddenberg@gmail.com>
pkgname=rdp-connect
pkgver=2.0.1
pkgrel=1
pkgdesc="🖥️ High-performance RDP connection manager for Hyprland, Niri & Wayland compositors with Quickshell, Walker & Wofi menus"
arch=(any)
url="https://github.com/hbuddenberg/rdp-connect"
license=(MIT)
depends=(bash jq freerdp libnotify util-linux)
optdepends=(
    "quickshell: modern native QML graphical modal selector"
    "walker: application launcher frontend"
    "wofi: Wayland application launcher"
    "rofi: application launcher"
    "hyprland: dynamic tiling Wayland compositor"
    "niri: scrollable-tiling Wayland compositor"
    "wireguard-tools: VPN connectivity"
)
install=rdp-connect.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95d89f035e8b6a8c4a360d79f165e54bd0ac5f819b1fcf9689b077d4aea46cfc')

package() {
    cd "$srcdir/$pkgname-$pkgver" || return

    # Engine CLI binary
    install -Dm755 engine/rdp-connect "${pkgdir}/usr/bin/rdp-connect"

    # Shared library
    install -Dm644 lib/rdp-common.bash "${pkgdir}/usr/share/rdp-connect/lib/rdp-common.bash"

    # Quickshell UI Modal
    install -Dm644 ui/shell.qml "${pkgdir}/usr/share/rdp-connect/ui/shell.qml"

    # Translations
    install -dm755 "${pkgdir}/usr/share/rdp-connect/i18n"
    install -Dm644 i18n/*.env "${pkgdir}/usr/share/rdp-connect/i18n/"

    # Default profile template
    install -Dm644 template/template.env "${pkgdir}/usr/share/rdp-connect/template/template.env"

    # Documentation
    install -dm755 "${pkgdir}/usr/share/doc/rdp-connect"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/rdp-connect/"

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
