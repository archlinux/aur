# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=2.12.1
pkgrel=1
pkgdesc="Omarchy theming application"
arch=('any')
url="https://github.com/bjarneo/aether"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'libsoup3' 'imagemagick')
optdepends=('omarchy: Theme application backend')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ac88a9cd1f1a9b85fe10e8e764bb08c5d9acff119504d99b98b9329a5a1ff853')  # Replace with actual checksum after creating GitHub release

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install source files
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r src templates "$pkgdir/usr/share/$pkgname/"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/aether" << 'EOF'
#!/bin/bash
cd /usr/share/aether || exit
exec gjs -m src/main.js "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/aether"

    # Install desktop entry
    install -Dm644 li.oever.aether.desktop "$pkgdir/usr/share/applications/li.oever.aether.desktop"

    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/aether.png"

    # Install license
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
