# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix-appimage
pkgver=7.2.0
pkgrel=1
pkgdesc="简洁、快速、安全的跨平台数据库管理工具，Helix/Vim 风格键位 (AppImage)"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('Apache-2.0')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=('gridix')
conflicts=('gridix' 'gridix-bin')
options=('!strip')
source=("gridix-${pkgver}.AppImage::https://github.com/MCB-SMART-BOY/Gridix/releases/download/v${pkgver}/gridix.AppImage"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/LICENSE")
sha256sums=('fd6d67c39ad0b08c49d339392991965c4364e4099def82da72007f276cd60846'
            '01132d0ac431cc5a8f34ea8ba055deb6f68d7034d8ed6f821b827f4b9195aae4')

prepare() {
    chmod +x "gridix-${pkgver}.AppImage"
}

package() {
    install -Dm755 "gridix-${pkgver}.AppImage" "$pkgdir/opt/gridix/gridix.AppImage"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/gridix" << 'END'
#!/bin/sh
exec /opt/gridix/gridix.AppImage "$@"
END
    chmod 755 "$pkgdir/usr/bin/gridix"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/gridix.desktop" << 'END'
[Desktop Entry]
Name=Gridix
Comment=跨平台数据库管理工具
Comment[en]=Cross-platform database management tool
Exec=gridix
Icon=gridix
Terminal=false
Type=Application
Categories=Development;Database;
Keywords=database;sql;sqlite;postgresql;mysql;
END

    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
