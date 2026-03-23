# Maintainer: Meepaw <git@github.com:Me3paw/VPN-gate-CLI.git>
pkgname=vpn-gate-client
pkgver=1.1.1
pkgrel=1
pkgdesc="A lightweight CLI and GUI for VPN Gate using NetworkManager with legacy OpenSSL support"
arch=('any')
url="https://github.com/Me3paw/VPN-gate-client"
license=('MIT')
depends=('python' 'python-requests' 'python-pyqt6' 'networkmanager' 'networkmanager-openvpn' 'hicolor-icon-theme')
makedepends=('git')
source=("${pkgname}::git+https://github.com/Me3paw/VPN-gate-client.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"

    # Install the scripts
    install -Dm755 "vpngate_cli.py" "${pkgdir}/usr/share/${pkgname}/vpngate_cli.py"
    install -Dm755 "vpngate-gui.py" "${pkgdir}/usr/share/${pkgname}/vpngate-gui.py"
    install -Dm644 "vpngate_core.py" "${pkgdir}/usr/share/${pkgname}/vpngate_core.py"
    
    # Install icons
    install -Dm644 "256.png" "${pkgdir}/usr/share/${pkgname}/256.png"
    install -Dm644 "64.png" "${pkgdir}/usr/share/${pkgname}/64.png"
    install -Dm644 "32.png" "${pkgdir}/usr/share/${pkgname}/32.png"
    
    # Create symlinks
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/vpngate_cli.py" "${pkgdir}/usr/bin/vpngate"
    ln -s "/usr/share/${pkgname}/vpngate-gui.py" "${pkgdir}/usr/bin/vpngate-gui"
    
    # Install desktop file
    install -Dm644 "vpngate-gui.desktop" "${pkgdir}/usr/share/applications/vpngate-gui.desktop"
    
    # Install the license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
