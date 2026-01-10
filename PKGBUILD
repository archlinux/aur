# Maintainer: Your Name <your@email.com>
pkgname=mycelica
pkgver=0.8.0
pkgrel=1
pkgdesc="Visual knowledge graph for connected thinking"
arch=('x86_64')
url="https://github.com/Ekats/Mycelica"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
makedepends=('rust' 'cargo' 'npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ekats/Mycelica/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79a298d2b99d2dfff6065355e0367ca2d7c7d302e09ed941f1ece45bd89a5240')

build() {
    cd "Mycelica-$pkgver"
    npm install
    NO_STRIP=1 npm run tauri build
}

package() {
    cd "Mycelica-$pkgver"
    install -Dm755 "src-tauri/target/release/mycelica" "$pkgdir/usr/bin/mycelica"
    install -Dm755 "src-tauri/target/release/mycelica-cli" "$pkgdir/usr/bin/mycelica-cli"
    install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/mycelica.png"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/mycelica.desktop" <<EOF
[Desktop Entry]
Name=Mycelica
Comment=Visual knowledge graph for connected thinking
Exec=mycelica
Icon=mycelica
Terminal=false
Type=Application
Categories=Office;Utility;
EOF
}
