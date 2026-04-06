# Maintainer: NetExperts <support@netexperts.com.au>
pkgname=netexperts-support-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="NetExperts Remote Support, Linux Outbound Client. Based on RustDesk (AGPL-3.0)."
arch=('x86_64')
url="https://netexperts.com.au/opensource"
license=('AGPL-3.0-only')
depends=('gtk3' 'libxcb' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon support'
            'libayatana-appindicator: modern tray icon support'
            'xdg-desktop-portal: Wayland screen capture')
provides=('netexperts-support')
conflicts=('netexperts-support' 'rustdesk' 'rustdesk-bin')
options=('!strip')
source=("https://netexperts.com.au/opensource/netexperts-support-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('0e4455565cfa995c75d093ca7f5f63bac20a951a5c0effd210798f5468a70886')

package() {
    # Install application bundle
    install -dm755 "${pkgdir}/usr/lib/netexperts-support"
    cp -r "${srcdir}/bundle/"* "${pkgdir}/usr/lib/netexperts-support/"

    # Binary symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /usr/lib/netexperts-support/rustdesk "${pkgdir}/usr/bin/netexperts-support"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/netexperts-support.desktop" <<EOF
[Desktop Entry]
Name=NetExperts Support
Comment=NetExperts Remote Support
Exec=/usr/bin/netexperts-support
Icon=netexperts-support
Terminal=false
Type=Application
Categories=Network;RemoteAccess;
StartupNotify=true
EOF

    # Icon
    install -Dm644 "${srcdir}/bundle/data/flutter_assets/assets/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/netexperts-support.svg"

}
