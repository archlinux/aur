pkgname=eshare-bin
pkgver=7.6.1023
pkgrel=1
pkgdesc="EShare screen sharing application (prebuilt vendor binary)"
arch=('x86_64')
url="https://eshare.app/"
license=('unknown')

# These tell pacman to replace any previous eshare installation
provides=('eshare')
conflicts=('eshare')
replaces=('eshare')

source=("local://eshare-${pkgver}-x86_64.pkg.tar.zst")
sha256sums=('SKIP')

package() {
    # Clean install path
    install -dm755 "$pkgdir/opt"
    cp -r opt/EShare "$pkgdir/opt/"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/eshare.desktop" <<EOF
[Desktop Entry]
Name=EShare
Comment=Screen sharing tool
Exec=/opt/EShare/EShare
Icon=/opt/EShare/icon.png
Type=Application
Categories=Utility;
EOF

    # Symlink
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/EShare/EShare "$pkgdir/usr/bin/eshare"
}

