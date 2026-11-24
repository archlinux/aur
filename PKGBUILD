# Maintainer: Ersin Tarhan <ersintarhan@gmail.com>
pkgname=netpad-vnext-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="A cross-platform C# editor and playground (vNext - Rust-based shell)"
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
depends=('webkit2gtk-4.1' 'dotnet-sdk' 'aspnet-runtime' 'hicolor-icon-theme')
provides=('netpad-vnext')
conflicts=('netpad-vnext')
source=("https://github.com/tareqimbasher/NetPad/releases/download/v${pkgver}/netpad_vnext-${pkgver}-linux-amd64.deb")
sha256sums=('8a290f2eb357644c81113080964ddf4c8d28c89fef9cfad2a2facc48b053d47d')

package() {
    cd "${srcdir}"
    ar x "netpad_vnext-${pkgver}-linux-amd64.deb"
    tar -xzf data.tar.gz -C "${pkgdir}"

    # The .deb ships its own desktop entry; keep only ours so the app is not listed twice.
    rm "${pkgdir}/usr/share/applications/NetPad vNext.desktop"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/netpad-vnext.desktop" <<EOF
[Desktop Entry]
Name=NetPad vNext
Comment=Cross-platform C# editor and playground (Rust-based)
Exec=/usr/bin/netpad-vnext
Icon=netpad-vnext
Terminal=false
Type=Application
Categories=Development;IDE;
StartupWMClass=netpad-vnext
StartupNotify=true
MimeType=application/x-netpad

EOF
}
