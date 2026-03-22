pkgname=nekobox-bin
pkgver=5.10.27
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64')
url="https://github.com/qr243vbi/nekobox"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'qt6-base' 'qt6-declarative' 'qt6-svg')
provides=('nekobox')
conflicts=('nekobox')

source=("https://github.com/qr243vbi/nekobox/releases/download/${pkgver}/nekobox-${pkgver}-linux-amd64.tar.gz")
sha256sums=('f93c4a4291e876426423d1582d90019e806b551e43e08f43513abfa0c523eaab')

package() {
    cd "$srcdir/nekobox"

    # Install main binary and resources
    install -dm755 "$pkgdir/opt/nekobox"
    cp -r * "$pkgdir/opt/nekobox/"

    # Symlink to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/nekobox/nekobox "$pkgdir/usr/bin/nekobox"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/nekobox.desktop" <<EOF
[Desktop Entry]
Name=NekoBox
Exec=nekobox
Icon=nekobox
Type=Application
Categories=Network;
EOF

    # Icon (if exists)
    if [ -f "$pkgdir/opt/nekobox/nekobox.png" ]; then
        install -dm755 "$pkgdir/usr/share/pixmaps"
        ln -s /opt/nekobox/nekobox.png "$pkgdir/usr/share/pixmaps/nekobox.png"
    fi
}
