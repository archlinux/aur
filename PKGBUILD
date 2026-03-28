# Maintainer: Gink <ginkcode@gmail.com>
pkgname=gsdb-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="A database management tool for PostgreSQL, MySQL, and SQLite (pre-built binary)"
arch=('x86_64')
url="https://github.com/ginkcode/gsdb"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'openssl' 'libssh2' 'libsecret')
provides=('gsdb')
conflicts=('gsdb')
source=(
    "GSDB_${pkgver}_amd64.AppImage::https://github.com/ginkcode/gsdb/releases/download/v$pkgver/GSDB_${pkgver}_amd64.AppImage"
    "https://raw.githubusercontent.com/ginkcode/gsdb/v$pkgver/src-tauri/icons/32x32.png"
    "https://raw.githubusercontent.com/ginkcode/gsdb/v$pkgver/src-tauri/icons/64x64.png"
    "https://raw.githubusercontent.com/ginkcode/gsdb/v$pkgver/src-tauri/icons/128x128.png"
    "https://raw.githubusercontent.com/ginkcode/gsdb/v$pkgver/src-tauri/icons/128x128@2x.png"
    "https://raw.githubusercontent.com/ginkcode/gsdb/v$pkgver/src-tauri/icons/icon.png"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    chmod +x "GSDB_${pkgver}_amd64.AppImage"
    ./"GSDB_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    # Install the extracted binary (no FUSE required at runtime)
    install -Dm755 "squashfs-root/usr/bin/gsdb" "$pkgdir/usr/bin/gsdb"

    # Install desktop entry
    install -Dm644 "/dev/stdin" "$pkgdir/usr/share/applications/gsdb.desktop" <<EOF
[Desktop Entry]
Name=GSDB
Comment=Database management tool for PostgreSQL, MySQL, and SQLite
Exec=gsdb
Icon=gsdb
Terminal=false
Type=Application
Categories=Development;Database;Utility;
StartupWMClass=gsdb
Keywords=database;sql;postgresql;mysql;sqlite;
EOF

    # Install icons
    install -Dm644 "32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/gsdb.png"
    install -Dm644 "64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/gsdb.png"
    install -Dm644 "128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/gsdb.png"
    install -Dm644 "128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gsdb.png"
    install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/gsdb.png"
}
