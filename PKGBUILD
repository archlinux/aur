# Maintainer: picharly
# AUR package for cyberghostvpn-gui

pkgname=cyberghostvpn-gui
pkgver=1.0.3   # Update with the latest release version
pkgrel=7
pkgdesc="A GUI for CyberGhost VPN"
arch=('x86_64')
url="https://github.com/picharly/cyberghostvpn-gui"
license=('MIT')
depends=('cyberghostvpn' 'sudo')
makedepends=()
source=("https://github.com/picharly/cyberghostvpn-gui/releases/download/${pkgver}/cyberghostvpn-gui_linux_amd64_${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/picharly/cyberghostvpn-gui/refs/heads/main/extras/cyberghostvpn-gui.desktop"
        "https://raw.githubusercontent.com/picharly/cyberghostvpn-gui/refs/heads/main/extras/cyberghostvpn-gui.png")
sha256sums=('8af482fc8650a4801d0f818f367576ebfde82a9175804d6ca8e11e4daff44170'
            '1df2b448a5e5386162ea8a467ead6987f17cd3220538e7c0b8891335168296fb'
            'a9d8cd955a0435741d460145918532295a44e1dfc2c1dab10c6f88cddd438980')  # Use 'SKIP' for GitHub releases, because they might change

package() {
    # Change to the source directory
    cd "$srcdir"
    
    # Extract the binary from the uncompressed file
    tar -xvzf "cyberghostvpn-gui_linux_amd64_${pkgver}.tar.gz"

    # Set the install directory
    _installdir=usr/local/cyberghostvpn-gui

    # Copy the uncompressed binary to /usr/sbin/
    install -Dm 755 "${srcdir}/cyberghostvpn-gui_linux_amd64_${pkgver}" "$pkgdir/${_installdir}/cyberghostvpn-gui"

    # Copy the .desktop file
    install -Dm 644 "${srcdir}/cyberghostvpn-gui.desktop" "$pkgdir/usr/share/applications/cyberghostvpn-gui.desktop"

    # Copy the icon to the icons directory
    install -Dm 644 "${srcdir}/cyberghostvpn-gui.png" "$pkgdir/usr/share/icons/cyberghostvpn-gui.png"

    install -dm 755 $pkgdir/usr/bin
    ln -s "/${_installdir}/cyberghostvpn-gui" "$pkgdir/usr/bin/cyberghostvpn-gui"
}
