# Maintainer: InnocentThief <https://codeberg.org/InnocentThief>
pkgname=custom-songs-manager-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Custom songs manager for Beat Saber"
arch=('x86_64')
url="https://codeberg.org/InnocentThief/custom-songs-manager"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2')
provides=('custom-songs-manager')
conflicts=('custom-songs-manager')

source=("custom-songs-manager-${pkgver}.deb::https://codeberg.org/InnocentThief/custom-songs-manager/releases/download/v${pkgver}/Custom%20Songs%20Manager_${pkgver}_amd64.deb")
sha256sums=('b6d6599901d2c3d182338ab5d2b374d74f73421566b0e55a8f229183720351f6')

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.gz

    install -Dm755 usr/bin/custom-songs-manager \
        "$pkgdir/usr/bin/custom-songs-manager"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/custom-songs-manager.desktop" << 'EOF'
[Desktop Entry]
Name=Custom Songs Manager
Comment=Manage custom songs for Beat Saber
Exec=custom-songs-manager
Icon=custom-songs-manager
Type=Application
Terminal=false
StartupWMClass=custom-songs-manager
Categories=Game;Utility;
EOF

    for size in 32x32 128x128; do
        install -Dm644 "usr/share/icons/hicolor/${size}/apps/custom-songs-manager.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/custom-songs-manager.png"
    done
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/custom-songs-manager.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/custom-songs-manager.png"

    install -Dm644 "usr/share/metainfo/custom-songs-manager.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/custom-songs-manager.metainfo.xml"
}
