# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=tema-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Omarchy theming application"
arch=('any')
url="https://github.com/bjarneo/tema"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita')
optdepends=('omarchy: Theme application backend')
install=tema.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6f07dbf9c7ac5f96a9cfb353e93c559e70db83d9d8f50716ff6528204e878104')  # Replace with actual checksum after creating GitHub release

package() {
    cd "$srcdir/tema-$pkgver"

    # Install source files
    install -dm755 "$pkgdir/usr/share/tema"
    cp -r src templates "$pkgdir/usr/share/tema/"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/tema" << 'EOF'
#!/bin/bash
cd /usr/share/tema || exit
exec gjs -m src/main.js "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/tema"

    # Install desktop entry
    install -Dm644 li.oever.tema.desktop "$pkgdir/usr/share/applications/li.oever.tema.desktop"

    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/tema.png"

    # Install license
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
