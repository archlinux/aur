# Maintainer: Your Name <your@email.com>
pkgname=mycelica
pkgver=0.8.0.1
pkgrel=1
_tag=0.8.0-1
pkgdesc="Visual knowledge graph for connected thinking"
arch=('x86_64')
url="https://github.com/Ekats/Mycelica"
license=('AGPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl')
makedepends=('rust' 'cargo' 'npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ekats/Mycelica/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('6ce6d266b9ccb28af073acf2ea0c5069436eacdea4173a6d0b45bd79cdaa97d6')

build() {
    cd "Mycelica-$_tag"
    npm install
    NO_STRIP=1 npm run tauri build
}

package() {
    cd "Mycelica-$_tag"
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
